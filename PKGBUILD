# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='cfrds'
pkgver='0.9'
pkgrel=1
pkgdesc='Client side ColdFusion RDS protocol.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/cfrds'
license=('MIT')
makedepends=('cmake' 'ninja' 'gcc')
depends=('glibc' 'pcre2')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    '130d29a93493344da920020eb0ed0195a342c15498f137e8017df3652fe04ad7183c994cd307f076080ea4db520d65881af5f74bab1391794c1024996ec2c0c5'
)

build() {
    cmake $pkgname-$pkgver -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B$pkgname-$pkgver/build -G Ninja
    ninja -C$pkgname-$pkgver/build
}

package() {
    ninja -C"$srcdir"/$pkgname-$pkgver/build install
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cfrds/LICENSE"
}
