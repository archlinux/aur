# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('cfrds')
pkgver='1.1.7'
pkgrel=3
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

sha512sums=('0077225d50b99ef796ed59b6ea9f6f0038c04d6c879f0c6db65784b8a451fe32653ed34ad2f5a3df753001bdc5c13e65ec4030964b31bd3d8e668d7800eb1ea4')

build() {
    export CFRDS_VERSION="$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B"$pkgname-$pkgver/build" -G Ninja "$pkgname-$pkgver"
    cmake --build "$pkgname-$pkgver/build"
}

package_cfrds() {
    cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cfrds/LICENSE"
}
