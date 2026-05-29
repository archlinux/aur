# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('cfrds')
pkgver='1.0.5'
pkgrel=1
options=(!debug)
pkgdesc='Client side ColdFusion RDS protocol.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/cfrds'
license=('MIT')
makedepends=('cmake' 'ninja' 'gcc' 'pkgconf')
depends=('libgcc' 'glibc' 'libxml2' 'json-c')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    '24c288f9428d0a7555997028cf3a09c8960f27058b28adf7cef855e01d87bb9cb68d9cf13d29df28b969a9585e598698fe12d65f9ce460c057110d4684542ae7'
)

build() {
    cmake -DCFRDS_GIT_TAG="$pkgver" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B"$pkgname-$pkgver/build" -G Ninja "$pkgname-$pkgver"
    cmake --build "$pkgname-$pkgver/build"
}

package_cfrds() {
    cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cfrds/LICENSE"
}
