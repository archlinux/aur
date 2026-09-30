# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('skyrc-usb')
pkgver='1.55.0'
pkgrel=1
options=(!debug)
pkgdesc='Low-level usb library for skyrc.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/skyrc-usb'
license=('MIT')
makedepends=('cmake' 'gcc')
depends=('glibc' 'hidapi')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    'd0c7499355dbf6334e1d890f8a985f6e0aefb597e2879a2a3b3adbb40ab0b41082fbccb9e97d79ced83c7585f08d4b5b760a2dce73b0ec9e7bc474da09e0ccfc'
)

build() {
    cmake -DLIBSKYRC_VERSION="$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B"$pkgname-$pkgver/build" "$pkgname-$pkgver"
    cmake --build "$pkgname-$pkgver/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/$pkgname-$pkgver/build" --prefix /usr
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
