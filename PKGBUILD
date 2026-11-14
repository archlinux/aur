# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=velocitty
pkgver=1.0.8
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
sha256sums=('83831b6fb8173e07ae5d0be08fd3965c7b941941fd39a276bf23fe0d31c285fe')

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
