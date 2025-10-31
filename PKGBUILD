# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

pkgname=openmodelica-bin
_omver=1.25.5
_debver=1
pkgver=${_omver}
pkgrel=3
pkgdesc="A complete Modelica modeling and simulation environment (from pre-compiled Debian Trixie binaries)"
arch=('x86_64')
url="https://openmodelica.org/"
license=('OSMC-PL')
provides=('openmodelica' 'openmodelica-omc')
conflicts=('openmodelica' 'openmodelica-omc' 'openmodelica-git')

depends=('blas' 'boost' 'clang' 'cmake' 'curl' 'expat' 'glibc' 'gcc-libs' 'hdf5' 'hwloc' 'icu' 'lapack' 'mesa' 'ncurses' 'omniorb' 'openmp' 'openscenegraph' 'python-numpy' 'python-simplejson' 'python-svgwrite' 'python-pyzmq' 'qt6-5compat' 'qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-tools' 'qt6-webengine' 'readline' 'sundials' 'suitesparse')

optdepends=(
    'java-runtime: For Java CORBA interface'
    'python-ompython: For OpenModelica-Python Integration'
    'python-statsmodels: For running test/doc scripts'
    'python-junit-xml: For running test/doc scripts'
    'python-natsort: For running test/doc scripts'
    'ruby: For running test/doc scripts'
    'texlive-bin: For LaTeX documentation generation in OMNotebook'
    'texlive-latex: For LaTeX documentation generation in OMNotebook'
)

_baseurl="https://build.openmodelica.org/omc/builds/linux/releases/${_omver}/pool/contrib-trixie"

source=(
    "${_baseurl}/omc-common_${_omver}-${_debver}_all.deb"
    "${_baseurl}/libomcsimulation_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomc_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomplot_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomsensplugin_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomsimulator_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omc_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omplot_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omshell_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omshell-terminal_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omnotebook_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omedit_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omsimulator_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/drmodelica_${_omver}-${_debver}_all.deb"
    "${_baseurl}/drcontrol_${_omver}-${_debver}_all.deb"
    "${_baseurl}/omlibrary_${_omver}-${_debver}_all.deb"
    "${_baseurl}/libomccpp_${_omver}-${_debver}_amd64.deb"
)

sha256sums=('79967f91a2c51fd2998fe3b7809916075eb185653ec88144f6aa6337b3e16d26'
            'be09a04c60ef28507680e9b0938bba7c2ea43ed8eaec298e1e00b1592dbbd961'
            '974bda9234cefedfc7dd0aaf0a5d2c32e8f923c8415dcc64f8f2b83eef702bde'
            '9aa9b13b4ea11d5caf380b36ff119765fc172578cc6eca69215ce1ddaf39ea8f'
            '2dfbd3419bd86e348d5b77f3ee5e80c2bdef1a7cad66ed3bf41137a4c1568691'
            '89e3e18d369e59e581cbe90aed8c108ac14c3d823eedfa996123bdf0b75597f8'
            '7236dfb5ae3819e99a3c9a1d837a66b2a89dc216d317f5b7b7290eeb7cd14577'
            'ff41154fac94d9dd21964ce92900919bda01f7f2286f26e28ffd58310306ca9a'
            '60ff44dfa5f41db444f20f3e765f291f76463829b08706fead1fba7aa179db94'
            '61b7c5a72d787fbb7f98abd1f73f3dbe70514fc56526dbc49941be7877d22dfb'
            'cf7d8c3a1c0429b47914c9f1ea8e045dbf2a1d71f0912000d69ad8fd9bf99852'
            '663c995d50f63e8fd59731669c84dad4758de22931d8b9bd824ccbe23ca91554'
            '347af2e0a959f3c0a8bba2bc03e66d7f54c2d6cfe056e92c1f01386abcef0942'
            '9f2bc7166f9cfc88e0cc49fe154cc92701116b1abf9ea03f9cf374f853ec636d'
            '4ad87e6e2a5190f198cd8a3edd065a95270f6560768e473b008f7b005bd69135'
            '3e3b6e67b39cedf7b9f3aaf0ce476e1bf0f8c95f77c6789241d92b0c1e109039'
            '0587f1c3d40af9e472b57d19fc68eaac3ad144c240662f909ea76c13317eb4e7')

package() {
    for deb in "${source[@]}"; do
        msg2 "Extracting $(basename "$deb")..."
        ar p "$srcdir/$(basename "$deb")" data.tar.xz | tar -xJ -C "$pkgdir/" --no-same-owner
    done

    install -d "$pkgdir/usr/share/applications"

    mv "$pkgdir/usr/share/applications/"{omedit,openmodelica-omedit}.desktop
    mv "$pkgdir/usr/share/applications/"{omnotebook,openmodelica-omnotebook}.desktop
    mv "$pkgdir/usr/share/applications/"{omshell,openmodelica-omshell}.desktop

    # Remove broken symlinks from Debian package
    rm "$pkgdir/usr/include/omc/cpp/boost"
    rm "$pkgdir/usr/include/omc/omsicpp/boost"
}
