# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('cfrds')
pkgver='1.1.5'
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
    '38536133aa24024ab3a4232afb1b982bfa0b4c8f54063b5ec3bea8892d6719b665ce3402990deb6a3555c984316a3bc7a4f4b53326ca8d34f45a21847b12b66d'
)

build() {
    cmake -DCFRDS_GIT_TAG="$pkgver" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B"$pkgname-$pkgver/build" -G Ninja "$pkgname-$pkgver"
    cmake --build "$pkgname-$pkgver/build"
}

package_cfrds() {
    cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cfrds/LICENSE"
}
