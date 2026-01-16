# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='logitech-k650-fix'
pkgver='0.9.3'
pkgrel=1
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
    '04e6114ea87f37f5abf79a789e9ae1c6308cd89d326686fcc26cdb8a15afe3f90d2f2aa90199e32942a24b7cdce40e54e9de6f732e79723a66b85ac86e1f64d3'
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
