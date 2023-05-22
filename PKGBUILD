_name=libtorrent-rasterbar
pkgname=${_name}-1
pkgver=1.2.19
pkgrel=1
pkgdesc="Open source C++ library implementing the BitTorrent protocol."
url="https://libtorrent.org/"
arch=('x86_64')
license=('BSD')
depends=('boost-libs' 'openssl')
makedepends=('cmake' 'boost')
provides=("${_name}=${pkgver}")
conflicts=("${_name}")
options=('!emptydirs')

_repo='libtorrent'
_snapshot="${_repo}-${pkgver}"

source=("${_snapshot}.tar.gz::https://github.com/arvidn/${_repo}/archive/v${pkgver}.tar.gz")
sha256sums=('c09c3f13dd6462d6ef0a5d1780ed0f73b504fcfbbdb5c6cad2cfad05daea50ba')

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -Dpython-bindings=OFF

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_snapshot}/COPYING"
}
