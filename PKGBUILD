# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='cfrds'
pkgver='0.9.2'
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
    'be952b255eaa6108b4fd052984de73deedcb1ab478ef9ef7b38bc2584a6b9b9d6055a79294b7b79bdab756e4d6ad87857d8f0b72942d9ffc0045cd00084a1620'
)

build() {
    cmake $pkgname-$pkgver -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B$pkgname-$pkgver/build -G Ninja
    ninja -C$pkgname-$pkgver/build
}

package() {
    ninja -C"$srcdir"/$pkgname-$pkgver/build install
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cfrds/LICENSE"
}
