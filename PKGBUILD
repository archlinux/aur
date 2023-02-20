# Maintainer: Tobias Borgert <tobias (dot) borgert (at) gmail (dot) com>

pkgname=ecal
pkgver=5.11.2
pkgrel=2
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64' 'armv7h')
url="https://github.com/eclipse-ecal/ecal"
license=('Apache')
depends=('curl' 'protobuf' 'qt5-base' 'qwt' 'hdf5' 'yaml-cpp')
makedepends=('cmake' 'doxygen' 'git' 'graphviz')
optdepends=()
source=("https://github.com/eclipse-ecal/ecal/releases/download/v${pkgver}/ecal-fat-source.tar.gz")
sha256sums=('95e5ce6b490d155d5e8e6a1f349803b0ea374a89356c79067d17fb67bb3f7386')
backup=('etc/ecal/ecal.ini' 'etc/ecal/ecaltime.ini')

prepare() {
#    patch --forward --strip=1 --input="../fineftp-server.filesystem.cpp.patch" "$pkgname/thirdparty/fineftp-server/fineftp-server/src/filesystem.cpp"
    :
}

build() {
    cd "${pkgname}"
    mkdir -p _build
    cd _build
    cmake -E env CXXFLAGS="-Wno-error=restrict" \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
             -DCMAKE_BUILD_TYPE=Release \
             -DECAL_THIRDPARTY_BUILD_PROTOBUF=OFF \
             -DECAL_THIRDPARTY_BUILD_CURL=OFF \
             -DECAL_THIRDPARTY_BUILD_HDF5=OFF \
             -DCMAKE_INSTALL_SYSCONFDIR=/etc
    make
}

package() {
    install -D -m644 "${srcdir}"/"${pkgname}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/asio/LICENSE_1_0.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/asio/LICENSE_1_0.txt
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/capnproto/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/capnproto/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/convert-utf/license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/convert-utf/license.txt
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/google-flatbuffers/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/google-flatbuffers/LICENSE.txt
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/google-protobuf/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/google-protobuf/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/google-test/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/google-test/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/npcap/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/npcap/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/google-test/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/google-test/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/qt/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/qt/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/simpleini/LICENCE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/simpleini/LICENCE.txt
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/spdlog/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/spdlog/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/tclap/COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/tclap/COPYING
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/termcolor/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/termcolor/LICENSE
    cd "${pkgname}"
    cd _build
    DESTDIR="$pkgdir" make install
}
