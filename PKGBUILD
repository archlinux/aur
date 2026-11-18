# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=superlight
pkgver=1.0.3
pkgrel=1
pkgdesc="System Monitor for Linux Desktops"
arch=('any')
url="https://github.com/xapp-project/superlight"
license=('GPL-3.0-or-later')
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
sha256sums=('681c815523e8939a39ed3602e2cd4184503a78a8732b81624e3d004bef7620c0')

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
