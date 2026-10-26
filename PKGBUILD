# Maintainer: Mark Wagie <mark at manjaro dot org>

pkgname=unfold-xapp
pkgver=1.0.3
pkgrel=1
pkgdesc="Archive Manager for Linux Desktops"
arch=('any')
url="https://github.com/xapp-project/unfold"
license=('GPL-3.0-or-later')
depends=(
  '7zip'
  'gtk3'
  'python-gobject'
  'python-setproctitle'
  'python-xapp'
  'xapp'
  'xapp-symbolic-icons'
)
makedepends=('meson')
checkdepends=('desktop-file-utils')
provides=('unfold')
conflicts=('unfold')
source=("unfold-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('75ec76b9727cbdce3d11e3a45833fe1db757594efaf4959749ea3fc38f784130')

build() {
  arch-meson "unfold-$pkgver" build
  meson compile -C build
}

check() {
  desktop-file-validate build/data/org.x.unfold.desktop
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
