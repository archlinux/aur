# Maintainer: erdii <me at erdii dot engineering>
pkgname=shaderbg
pkgver=027d4f87fd542c79d4276b521e39025477b6d03e
pkgrel=0
pkgdesc="This program lets you render shaders as a wall paper. It works on Wayland compositors that support wlr-layer-shell."
arch=('any')
url="https://git.sr.ht/~mstoeckl/shaderbg"
license=('GPL-3.0-only')
depends=('wayland' 'libglvnd')
makedepends=('meson' 'gcc')

source=("https://git.sr.ht/~mstoeckl/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0a2531ac1613d5d5f3081af1d69a674d1ed3b4a564855234eff1256c4384c65e')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
