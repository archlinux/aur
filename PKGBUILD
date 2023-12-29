# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='cfrds'
pkgver='0.8'
pkgrel=1
pkgdesc='Client side ColdFusion RDS protocol.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/cfrds'
license=('MIT')
makedepends=('cmake' 'ninja' 'gcc')
depends=('glibc')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    '0480af5ebd48732eadcd1215392702cbba6257af0182b287e6ff2392c1dcd13255f7cd44d653ada0949505c7fe59f95136253bc219c2ca901740821175cdbaee'
)

build() {
    cmake $pkgname-$pkgver -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B$pkgname-$pkgver/build -G Ninja
    ninja -C$pkgname-$pkgver/build
}

package() {
    ninja -C"$srcdir"/$pkgname-$pkgver/build install
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cfrds/LICENSE"
}
