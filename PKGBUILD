# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=velocitty
pkgver=1.0.7
pkgrel=1
pkgdesc="Terminal for Linux desktops"
arch=('any')
url="https://github.com/xapp-project/velocitty"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-gobject'
  'python-setproctitle'
  'python-xapp'
  'vte4'
  'xapp-symbolic-icons'
)
makedepends=('meson')
checkdepends=('desktop-file-utils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('13aa9cbc61797d461349a410d8a6171728a9446afb5b240e546023a0e9deb387')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  desktop-file-validate "build/data/org.x.$pkgname.desktop"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
