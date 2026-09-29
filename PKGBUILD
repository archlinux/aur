# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('skyrc-bt')
pkgver='1.89.0'
pkgrel=1
options=(!debug)
pkgdesc='Low-level library for skyrc Bluetooth module.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/skyrc-bt'
license=('MIT')
makedepends=('cmake' 'gcc')
depends=('glibc' 'glib2')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    '8d0b67adf6fe51948e6faac99399ada036a0a73d56265df40526e7f1abea02dae11a5d6ba86dce3b94da8694cebcb6e1899f2951c051deacb9a9b4d034b5a01e'
)

build() {
    cmake -DLIBSKYRC_VERSION="$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B"$pkgname-$pkgver/build" "$pkgname-$pkgver"
    cmake --build "$pkgname-$pkgver/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/$pkgname-$pkgver/build" --prefix /usr
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
