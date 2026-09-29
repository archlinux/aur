# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('skyrc-wifi')
pkgver='4.2.0'
pkgrel=1
options=(!debug)
pkgdesc='Low-level library for skyrc wifi module.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/skyrc-wifi'
license=('MIT')
makedepends=('cmake' 'gcc')
depends=('glibc' 'json-c')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    '9b16e54e8eab1fe099ea32b0c0d63dbd4995ae53cf417c7d0bb3a657d66fa18ec1e95c0b1857f338db902dce083af28f74688a4202fae7b7d9e8090f75e38057'
)

build() {
    cmake -DLIBSKYRC_VERSION="$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B"$pkgname-$pkgver/build" "$pkgname-$pkgver"
    cmake --build "$pkgname-$pkgver/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/$pkgname-$pkgver/build" --prefix /usr
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
