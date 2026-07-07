# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

pkgname=openmodelica-bin
_omver=1.27.0
_debver=1
pkgver=${_omver}
pkgrel=1
pkgdesc="A complete Modelica modeling and simulation environment (from Debian binaries)"
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

_baseurl="https://build.openmodelica.org/omc/builds/linux/releases/${_omver}/pool/contrib-trixie"

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

sha256sums=('d9ae17e30d06589314525bd2c60596e3f9efb3ce28c279c16e47943a511ffca6'
            '6ccdb20eb570647a47cc4b23384508816919cc9b11400fa9360c630fb14e9a0b'
            '67c131ba3cc84518fcb3a8dec3ab3457de6aeaa22682bf828af16b0644991e8d'
            '7c1412a94259d0f7dc54d0b399c77a967f7fb0be0ddb103cdfc18ddac3c1a01b'
            'bc60642480882b7fc9f7f86389665a72bd2fb0bf52a276e44af54772696d3758'
            'eda1bb59ab711b38801bb8da074a7e99e26024341678f3d8e2ef3b75f6c0c6ee'
            '9a43806a5e447566c7ab8446afedfd24d2b8eeead6cbc2f217b0bf65b72f5740'
            'edfb26ac749b7b1bbe56681ffe989f007a03c2a6152695edfbdc082b14ec7454'
            'b2ac5a5e1a2a6283e974a33d93989cbca6c49ddd9b470f05ddc339d377ccc881'
            '8a26e0087e9334777c6f1d2440dd21d523ed7d35625b3410ae286c6305e8d4dc'
            '6b08ef82a5d7d5d06fa6bd60cfd673a1e27747476edf6340cbf1a6c9011c0af1'
            '08eb23cf08ddfa9b9684f5155e005d3e4dea6bd4ae050f81570c985740496222'
            '43f07452e18de92fa30dfaaad1b5259f6cf3d51546e28832600fb069e8c9208b'
            '4fa2925e57dd32307a484aa33527ae89e89fc5b31a96c40fdcbed4a01968eb79'
            '36d9a60280bbc02a7ae7a95997e7d44db8f2df0c25d9f5390d09b6e2ae620ad4'
            'dd0fe83f21058e8a09e6573c6f33cb7fb8c6d4b95548a2bcda05fade737e2885'
            '9d9a271df4aa830b5b153489cdce234e731f48526b58d2308b5651fd55198a64'
            'd293dca131fad3ea238967899480b447ea00be40b1548413e16c2874847a5ed8')

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
