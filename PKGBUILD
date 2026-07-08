# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

pkgname=openmodelica-bin
_omver=1.27.0
_debver=1
pkgver=${_omver}
pkgrel=3
pkgdesc="A complete Modelica modeling and simulation environment (from pre-built .deb binaries)"
arch=('x86_64')
url="https://openmodelica.org/"
license=('OSMC-PL')
provides=('openmodelica' 'openmodelica-omc')
conflicts=('openmodelica' 'openmodelica-omc' 'openmodelica-git')

depends=('bash' 'blas' 'boost' 'clang' 'cmake' 'curl' 'expat' 'glibc' 'gcc-libs' 'hdf5' 'hwloc' 'icu' 'lapack' 'libglvnd' 'mesa' 'ncurses' 'omniorb' 'openmp' 'openscenegraph' 'python' 'python-numpy' 'python-simplejson' 'python-svgwrite' 'python-pyzmq' 'qt6-5compat' 'qt6-base' 'qt6-declarative' 'qt6-positioning' 'qt6-svg' 'qt6-tools' 'qt6-webchannel' 'qt6-webengine' 'readline' 'sundials' 'suitesparse' 'util-linux-libs')

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

_baseurl="https://build.openmodelica.org/omc/builds/linux/releases/${_omver}/pool/contrib-resolute"

source=(
    "${_baseurl}/drcontrol_${_omver}-${_debver}_all.deb"
    "${_baseurl}/drmodelica_${_omver}-${_debver}_all.deb"
    "${_baseurl}/libomc_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomccpp_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomcsimulation_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomplot_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomsensplugin_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/libomsimulator_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omc-common_${_omver}-${_debver}_all.deb"
    "${_baseurl}/omc_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omedit_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omlibrary_${_omver}-${_debver}_all.deb"
    "${_baseurl}/omnotebook_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omplot_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omshell-terminal_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omshell_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/omsimulator_${_omver}-${_debver}_amd64.deb"
    "${_baseurl}/openmodelica_${_omver}-${_debver}_amd64.deb"
)

sha256sums=('dcce3ee85f8f4a59b1171f8e500b9512365f88285ada23309c968d44c988853a'
            '48cf5f1e85be521a4e76836cc0ac311e7f2d21dc186a5651e7c64e33ed21fb5f'
            'cceca8e0e3d2c780c082e4798f43bcf46598954a36c95b125caf454883cd3b4d'
            'c107cd44a9e4ec66571fa36612a5aa12c647a93a1b934a86fce787906ac908d2'
            'daffafb70c1101383e7902052ede1697ed56789eb478eca2d05d04535863b89d'
            '62042377ee26f9e58e661d1a4fbe00be2da74add1bc94413f62d5f3ddc23387f'
            '8630b081b82bbdfb7c4e4f58c759b23db412df55155f0afd85e900143fbb3fb3'
            '5c4608c9a2c8078e178e84f68e995d5266dbe90d2eb7ad91547db8d5e48fd996'
            'a25afd9a659389714fad86941d601e5d1d6835afc4fc8f46af9038e340f731ff'
            '7a2504be7f3e9f77443d0fa302fc95d7b177ecba12cad2a5accba74c5ff6a0a5'
            'e0c278a084e6ebc2f6bc3e3c3b1a8bbd0ecd439bd56599002aaeab50554b7400'
            'ef571e4347ac8d6c2f0c22f8687ba5e7f2e50b332bd7f0db605fae59aa7e371c'
            '8e200cdbe5cdf7de09de0b47fb56efd1b0d2796db279fb311055a1bcfe5e6991'
            '5e43b6cb6992a9bac6a5fa632be901f98cd8c4bdf79eeac59c90cc02846dc205'
            '887898bb91b5e274efc5da39b6de3f58ce75bf6e0e6aedc1bbd6fd174bcc85c3'
            'fa011e38fcb0aba9178c2f6739f6cddb3d9168949c99824e9fca6a1b38554675'
            '1612998509e1bb5f9b1046d88c9cabf38a6591f059229df43e5757e8ebe3a407'
            '11d2585a729b59f2a799c2039c7ddfd4b1927b92f8ac6480a93afe515f9af67c')

package() {
    for deb in "${source[@]}"; do
        msg2 "Extracting $(basename "$deb")..."
        ar p "$srcdir/$(basename "$deb")" data.tar.xz | tar -xJ -C "$pkgdir/" --no-same-owner
    done

    install -d "$pkgdir/usr/share/applications"

    mv "$pkgdir/usr/share/applications/"{omedit,openmodelica-omedit}.desktop
    mv "$pkgdir/usr/share/applications/"{omnotebook,openmodelica-omnotebook}.desktop
    mv "$pkgdir/usr/share/applications/"{omshell,openmodelica-omshell}.desktop

    install -Dm644 "$pkgdir/usr/share/doc/openmodelica/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Previously had these here to remove broken symlinks, no longer needed.
    # rm "$pkgdir/usr/include/omc/cpp/boost"
    # rm "$pkgdir/usr/include/omc/omsicpp/boost"
}
