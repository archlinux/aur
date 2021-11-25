# Maintainer: Svend Christian Svendsen <svendcs@svendcs.com>

pkgname=judoassistant
pkgver=0.6.0
pkgrel=1
pkgdesc="Judo Tournament Software Suite"
url="https://judoassistant.com"
depends=('boost-libs' 'qt5-base' 'zstd' 'noto-fonts' 'openssl')
makedepends=('boost' 'meson' 'ninja')
arch=('i686' 'x86_64')
license=("MIT")
source=("https://github.com/judoassistant/judoassistant/releases/download/v$pkgver-beta/judoassistant-$pkgver.tar.xz")
sha1sums=('b8d142ed568fc1c77bacb0c8378594e1a515da93')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    meson build --buildtype=release -Dprefix="/usr" -Dweb=false
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    DESTDIR="$pkgdir" ninja install
}

