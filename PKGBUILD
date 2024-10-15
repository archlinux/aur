# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='logitech-k650-fix'
pkgver='0.9.2'
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
    '35133bcd3dfdcf251c0407402de525abaf2fa03272f433ffd2979748d57a4ac9a48505f821021a675073a23d3e95f3253d741849cc84c082fa1d9cb770b2b382'
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
