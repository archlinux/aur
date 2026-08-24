# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('cfrds')
pkgver='1.1.6'
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
    'a7c3bd143bf57f8984d35d4fc12b6e960146371f2d2023b0bf3d985b9dc63c28c23fb3448882e1840f6c1b3df0ee7628fa24f515c5d5f029f5f48e40826bd53f'
)

build() {
    cmake -DCFRDS_GIT_TAG="$pkgver" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B"$pkgname-$pkgver/build" -G Ninja "$pkgname-$pkgver"
    cmake --build "$pkgname-$pkgver/build"
}

package_cfrds() {
    cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cfrds/LICENSE"
}
