# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('stress_solver')
pkgver='1.0.0'
pkgrel=1
options=(!debug)
pkgdesc='Structural analysis solver for CIVILSOFT Plus .DAT files.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/stress'
license=('MIT')
makedepends=('cmake' 'gcc')
depends=('glibc')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    '26c60496c7ab9914e16af6e9a105dc2d4432f20515b7189dd80b6e0218a91dbc25cd983d2d0a0f04ca3ed145129523abaf8b0385fcd003e8eed61a3cd89e0166'
)

build() {
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_BUILD_TYPE=Release -B"$pkgname-$pkgver/build" "$pkgname-$pkgver"
    cmake --build "$pkgname-$pkgver/build"
}

package() {
    cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/stress_solver/LICENSE"
}
