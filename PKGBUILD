# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='logitech-k650-fix'
pkgver='0.9.2'
pkgrel=2
pkgdesc='Fix(insert key) Logitech K650 keyboard.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/logitech-k650-fix'
license=('MIT')
makedepends=('gcc' 'cmake' 'ninja')
depends=('glibc' 'systemd-libs')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    '829a24836e480f5853601259d7af4ce697b60414fc7c5f0c4cd597302ed51c18193d140d98a4ed59c1b2a1522072938619b32d3a8d37c700e3daa1fcfd4bd791'
)

build() {
    cmake "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B"$pkgname-$pkgver/build" -G Ninja
    cmake --build "$pkgname-$pkgver/build"
}

package() {
    cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/logitech-k650-fix.service" "$pkgdir/usr/lib/systemd/system/logitech-k650-fix.service"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/logitech-k650-fix/LICENSE"
}
