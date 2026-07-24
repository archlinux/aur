# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('cfrds')
pkgver='1.1.1'
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
    '14374dca51681f810240e06ce02a17851743c07c11abc39f067480407866fd9672b4b30420d52f7d92e4671627842ca770027561781e7a74e118dfe7bb11d549'
)

build() {
    cmake -DCFRDS_GIT_TAG="$pkgver" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B"$pkgname-$pkgver/build" -G Ninja "$pkgname-$pkgver"
    cmake --build "$pkgname-$pkgver/build"
}

package_cfrds() {
    cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cfrds/LICENSE"
}
