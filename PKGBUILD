# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='logitech-k650-fix'
pkgver='0.9.1'
pkgrel=1
pkgdesc='Fix(insert key) Logitech K650 keyboard.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/logitech-k650-fix'
license=('MIT')
makedepends=('gcc' 'cmake' 'ninja')
depends=('glibc')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    '235f96cff4154bcf71928cc86d6a5f0f41ae7a3e5f146e0baa9df324bcf82f95e3945e9d772f3f9856ea870fb3852d866733ac1194d771d0d44eb0d4f1972a9a'
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
