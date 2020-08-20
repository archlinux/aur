# Maintainer: Svend Christian Svendsen <svendcsvendsen@gmail.com>

pkgname=judoassistant
pkgver=0.2.0
pkgrel=1
pkgdesc="Judo Tournament Software Suite"
url="https://judoassistant.com"
depends=('boost-libs' 'qt5-base' 'zstd' 'noto-fonts' 'openssl')
makedepends=('boost' 'meson' 'ninja')
arch=('i686' 'x86_64')
license=("MIT")
source=("https://github.com/judoassistant/judoassistant/releases/download/v$pkgver-alpha/judoassistant-$pkgver.tar.xz")
sha1sums=("b358354cf9f280082072c4f13e717db230ab44ab")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    meson build --buildtype=release -Dprefix="/usr" -Dweb=false
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    DESTDIR="$pkgdir" ninja install
}

