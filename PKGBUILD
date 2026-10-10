# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

pkgname=openmodelica-bin
_omver=1.27.1
_debver=1
pkgver=${_omver}
pkgrel=1
pkgdesc="A complete Modelica modeling and simulation environment (from pre-built .deb binaries)"
arch=('x86_64')
url="https://openmodelica.org/"
license=('OSMC-PL')
provides=('openmodelica' 'openmodelica-omc')
conflicts=('openmodelica' 'openmodelica-omc' 'openmodelica-git')

depends=('bash' 'blas' 'boost' 'clang' 'cmake' 'curl' 'expat' 'glibc' 'gcc-libs' 'hdf5' 'hwloc' 'icu' 'lapack' 'libcurl-gnutls' 'libglvnd' 'mesa' 'ncurses' 'omniorb' 'openmp' 'openscenegraph' 'python' 'python-numpy' 'python-simplejson' 'python-svgwrite' 'python-pyzmq' 'qt6-5compat' 'qt6-base' 'qt6-declarative' 'qt6-positioning' 'qt6-svg' 'qt6-tools' 'qt6-webchannel' 'qt6-webengine' 'readline' 'sundials' 'suitesparse' 'tracexec' 'util-linux-libs')

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

noextract=("${source[@]##*/}")

sha256sums=('b19e76c2540c9f5390d44e69781c39c00f40ab2bb4d5f4c6068331e5db5052af'
            'ec0492f1f69c6b9e301d8f65de4f98ba5c607af7193e68d4bcb293a6faa2772b'
            '77222b576707a227c1dbeb244beb53369ee3715d533cad99acd1caad07d1d852'
            'f27822ce602cbd189e8cf66630ff18bf89c1b454111b1607dd8ebbc0769a2890'
            '3117e4851d665fffb12c940cfcf67743af0e9a5f4ab1108bbb9b90e9cdcae26e'
            '155bb5d6153e7e63572e0266a65fc28267fad5bde17b5e3f7d0212e09483d852'
            '1c825261c691f3f081ca42ac4119f5d81b78febce1c77970fc8c68cff0ca6c78'
            '94881aaa3f679778e3700e3d6fe7588d7071f4f6b7a0d8edaf9ca91d866d8524'
            'b995acdf45b101b25cd3a7b56ee153a5f807be657c1825fac5dd174e8651c6a6'
            '3c3ed6a1768f943cc2756b42306d45e1326c07cf9523817c97afbcf1723e3bba'
            '361381af74c46860abd07d165b0f2024ef71b6b4e718ed4ba85b1d32fef80538'
            'fd3fecb477d2c81c6ff3a548d3564d422455d83f2499dd6807b9840418309c24'
            '56a9ae203de834fc884191aa89c007cbd3d671db200280507587213762b8cee7'
            '57eafc8179e1ed88a005116e702a4b26c6c645b914efad8ef6a6269c6d965ed6'
            '12f62a66f3c079b4900ef13d01e981860818d229e3bf44d861d97e68db585ab8'
            '406b340d10e6c12bca35bbaa8d22d7dbdf00d280f41d41d60483e92a1fef84f0'
            '11e36dd1d0b13cb7d3a5fae65fcb3c89fc7027574add5d496e1f8304fc2b8282'
            '6048999491bc16db57fa7be76ca1e88c5feff6641242acfe996e06a2b9b4ebc0')

package() {
    for deb in "${source[@]}"; do
        msg2 "Extracting $(basename "$deb")..."
        ar p "$srcdir/$(basename "$deb")" data.tar.zst | tar -x --zstd -C "$pkgdir/" --no-same-owner
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
