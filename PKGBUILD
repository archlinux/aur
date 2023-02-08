_name=libtorrent-rasterbar
pkgname=${_name}-1
pkgver=1.2.18
pkgrel=2
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
sha256sums=('c4213bfb695db3e3b266be71865a7942f9007200aa4021946818fdc5e5e4a3d3')

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
