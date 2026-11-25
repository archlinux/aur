# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='logitech-k650-fix'
pkgver='0.9.4'
pkgrel=1
pkgdesc='Fix(insert key) Logitech K650 keyboard.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/logitech-k650-fix'
license=('MIT')
makedepends=('gcc' 'cmake' 'ninja')
depends=('glibc' 'systemd-libs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("6b46c3c1bb3afb63273390e7c7db4ac382a5864c4f2e3ca6af5dbe744911e7e4ac9ece542dec40166f1a56a9b05dd8492ec28b106744683ccc556b27f42af0ff")

build() {
    cmake "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -B"$pkgname-$pkgver/build" -G Ninja
    cmake --build "$pkgname-$pkgver/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/logitech-k650-fix/LICENSE"
}
