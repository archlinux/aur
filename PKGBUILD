# Maintainer: Svend Christian Svendsen <svendcs@svendcs.com>

pkgname=judoassistant
pkgver=0.7.0
pkgrel=1
pkgdesc="Judo Tournament Software Suite"
url="https://judoassistant.com"
depends=('boost-libs' 'qt5-base' 'zstd' 'noto-fonts' 'openssl')
makedepends=('boost' 'meson' 'ninja')
arch=('i686' 'x86_64')
license=("MIT")
source=("https://github.com/judoassistant/judoassistant/releases/download/v$pkgver-beta/judoassistant-$pkgver.tar.xz")
sha1sums=('ee5ba9e64daa2e94f8c9f72d63f41b3f71ce1a38')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    meson build --buildtype=release -Dprefix="/usr" -Dweb=false
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    DESTDIR="$pkgdir" ninja install
}

