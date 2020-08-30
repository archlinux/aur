# Maintainer: Svend Christian Svendsen <svendcs@svendcs.com>

pkgname=judoassistant
pkgver=0.3.0
pkgrel=1
pkgdesc="Judo Tournament Software Suite"
url="https://judoassistant.com"
depends=('boost-libs' 'qt5-base' 'zstd' 'noto-fonts' 'openssl')
makedepends=('boost' 'meson' 'ninja')
arch=('i686' 'x86_64')
license=("MIT")
source=("https://github.com/judoassistant/judoassistant/releases/download/v$pkgver-alpha/judoassistant-$pkgver.tar.xz")
sha1sums=("c79da6b4ecb260ce4c2c94d462a1625676e9940c")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    meson build --buildtype=release -Dprefix="/usr" -Dweb=false
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    DESTDIR="$pkgdir" ninja install
}

