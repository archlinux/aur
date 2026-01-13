# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

pkgname=openmodelica-bin
_omver=1.26.1
_debver=1
pkgver=${_omver}
pkgrel=1
pkgdesc="A complete Modelica modeling and simulation environment (from Debian binaries)"
arch=('x86_64')
url="https://openmodelica.org/"
license=('OSMC-PL')
provides=('openmodelica' 'openmodelica-omc')
conflicts=('openmodelica' 'openmodelica-omc' 'openmodelica-git')

depends=('bash' 'blas' 'boost' 'clang' 'cmake' 'curl' 'expat' 'glibc' 'gcc-libs' 'hdf5' 'hwloc' 'icu' 'icu76' 'lapack' 'libglvnd' 'mesa' 'ncurses' 'omniorb' 'openmp' 'openscenegraph' 'python' 'python-numpy' 'python-simplejson' 'python-svgwrite' 'python-pyzmq' 'qt6-5compat' 'qt6-base' 'qt6-declarative' 'qt6-positioning' 'qt6-svg' 'qt6-tools' 'qt6-webchannel' 'qt6-webengine' 'readline' 'sundials' 'suitesparse' 'util-linux-libs')

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

_baseurl="https://build.openmodelica.org/omc/builds/linux/releases/${_omver}/pool/contrib"

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

sha256sums=('2e710188a4e9fdc8be08194ff3b4baf41a2176f790b814918c16d1769d67cb13'
            'd7219e1c3aee92a5f6bf5cd8aa843b2d3484e6ff02c36907c9b6754bb8a7b637'
            '831e0e8e47eaebbbb91b5c4f431b8a5427783609d26d43ac4c3941712eafa17a'
            'eef97f21a7f2e6163f38cee0ee3321165773b4a5d795d223299e25e7ab055027'
            '3c7eb39e6d59bd27695224bf6f0d98d9557c9cf1c66e169ed90054670dd1f4a0'
            '65bda764e01a7f5b675a5e1167f93411a1194237ef68031d72aad2aa3c2d944e'
            '9096c2df7ef2d0343976d21541822e7d019863ffc55225f926a19b4496637b7f'
            '0394c9bd13d211dfb6131f6a49ab90d265e6297138fdf1ff56a64026c50a548d'
            '7978adf3e965488bcf158d62cfd26f03dde5eb2e12123004b3237baba6a67d8a'
            'c1a4eddc642e2176bdbd1708db61e37d351abd46343778bd5a7093e36af7df35'
            '3d48e0c6e1478fa9ce5a5c8974e0503c4c65ac2a87608bc4004529ff92d3f408'
            '8a1a8ed38f4b385014beadf3d0c2ec228ee32a4fb2465843662745bff6762abf'
            '916cb86a58d9cdd8bbb71bf9b5d00b8e9f4b11d5b18a37b239a60c15fccce795'
            '4ec96460dc0b2967e73e9478c74f190edda3928166c534f8185664e646bcf717'
            'a8ed9598071d14bc691c25b9a9c8d9c19f0daaa551534da7f60841fe0b687dc3'
            '8e61f4c81e2761bb7349f68fbfbd3a3748b788e1f90e2521d682f8a91278d787'
            'ca8fbef396ce74d691685a0641f92b0fe3d7be4575613060bd15ccc3b0deacc4'
            'deacef8c6de921333580f99f7e87a9df648dda64bf7ffbe07be8ad6991e3219a')

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

    # Remove broken symlinks from Debian package
    rm "$pkgdir/usr/include/omc/cpp/boost"
    rm "$pkgdir/usr/include/omc/omsicpp/boost"
}
