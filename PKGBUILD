# Maintainer: lanthora <lanthora@outlook.com>

pkgname=candy
pkgver=5.0
pkgrel=1
pkgdesc="Another virtual private network that supports peer-to-peer connections"
url="https://github.com/lanthora/candy"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lanthora/candy/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('37c7f33cb8698e4ab8cd68ea0c509326e3d9616caa70d7c4e886f4ac1f12de8b')
makedepends=('cmake' 'ninja' 'pkgconf' 'gcc' 'git')
depends=('zlib' 'fmt' 'glibc' 'gcc-libs' 'openssl' 'libconfig' 'uriparser' 'spdlog')
backup=('etc/candy.conf')

build() {
        cd "$pkgname-$pkgver"
        cmake -B build -G Ninja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
        cmake --build build
}

package() {
        cd "$pkgname-$pkgver"
        install -Dm644 candy.conf "$pkgdir/etc/candy.conf"
        install -Dm644 candy.service "$pkgdir/usr/lib/systemd/system/candy.service"
        install -Dm644 candy@.service "$pkgdir/usr/lib/systemd/system/candy@.service"
        install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
        DESTDIR="$pkgdir" cmake --install build
}
