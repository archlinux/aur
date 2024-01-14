# Maintainer: lanthora <lanthora@outlook.com>

pkgname=candy
pkgver=3.7
pkgrel=2
pkgdesc="Another virtual private network that supports point-to-point connections"
url="https://github.com/lanthora/candy"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lanthora/candy/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('a2cbfdcf2350ee41bfe388a9140c3cf5ef76da592ee4ae5ac20a7841fd38dc16')
makedepends=('cmake' 'make' 'pkgconf' 'gcc' 'git' 'spdlog')
depends=('zlib' 'fmt' 'glibc' 'gcc-libs' 'openssl' 'libconfig' 'uriparser')
depends_aarch64=('spdlog')
depends_armv7h=('spdlog')
backup=('etc/candy.conf')

build() {
        cd "$pkgname-$pkgver/build"
        cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
        make
}

package() {
        cd "$pkgname-$pkgver"
        install -Dm644 candy.conf "$pkgdir/etc/candy.conf"
        install -Dm644 candy.service "$pkgdir/usr/lib/systemd/system/candy.service"
        install -Dm644 candy@.service "$pkgdir/usr/lib/systemd/system/candy@.service"
        install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
        cd build
        make DESTDIR="$pkgdir/" install
}
