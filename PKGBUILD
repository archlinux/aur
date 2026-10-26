# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=superlight
pkgver=1.0.2
pkgrel=1
pkgdesc="System Monitor for Linux Desktops"
arch=('any')
url="https://github.com/xapp-project/superlight"
license=('GPL-3.0-or-later')
groups=('x-apps')
depends=(
  'gtk3'
  'python-cairo'
  'python-gobject'
  'python-setproctitle'
  'python-xapp'
  'upower'
  'xapp'
  'xapp-symbolic-icons'
)
makedepends=('meson')
checkdepends=('desktop-file-utils')
optdepends=('flatpak: List what is installed with Flatpak')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0a5322ddce02ec8b676994be3156ac484306dade5cb5d5f8ffc7b3dbe1de488b')

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
