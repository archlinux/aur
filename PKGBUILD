# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='cfrds'
pkgver='0.9.4'
pkgrel=2
pkgdesc='Client side ColdFusion RDS protocol.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/cfrds'
license=('MIT')
makedepends=('cmake' 'ninja' 'gcc' 'pkgconf')
depends=('glibc')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    '8462a9e99798ced613e771d6ea117496ceaf84422b0750ab144dc95dbcb3631b5534e48d9f20dd48099ea4f7f10ad0fb29285b169ef08ab5c403f131492ccb53'
)

build() {
    cmake "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B"$pkgname-$pkgver/build" -G Ninja
    cmake --build "$pkgname-$pkgver/build"
}

package() {
    cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cfrds/LICENSE"
    install -Dm644 "$srcdir/$pkgname-$pkgver/pkgconfig/cfrds.pc" "$pkgdir/usr/lib/pkgconfig/cfrds.pc"
}
