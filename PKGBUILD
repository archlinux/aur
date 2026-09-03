# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('dspoh')
pkgver=1.0.1
pkgrel=1
options=(!debug)
pkgdesc='Linux tray app that shows DeepSeek peak/off-peak pricing and time until the next change'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/dspho'
license=('MIT')
makedepends=('cmake' 'gcc' 'pkgconf')
depends=('glibc' 'glib2' 'cairo' 'pango' 'sdl3' 'hicolor-icon-theme')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/dspho/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    '4e12c5c617a6653892d4ce1d4d159118763893d9b7af64670a688fac5986880aaea9cb91990a3822ead154b746cd50fa9b37f584987deae4bc69f3cd8ee5b9f2'
)

build() {
    cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -DDSPOH_VERSION="$pkgver" -B"build" "$srcdir/dspho-$pkgver"
    cmake --build "build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "build"
    install -Dm644 "$srcdir/dspho-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
