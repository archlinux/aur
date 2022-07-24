# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=thingy
pkgver=1.0.9
pkgrel=1
pkgdesc="Utility application used to make collections and quickly access recent and favorite documents."
arch=('any')
url="https://github.com/linuxmint/thingy"
license=('GPL3')
depends=('libgsf' 'python-gobject' 'python-setproctitle' 'xapp')
optdepends=('libreoffice' 'xreader')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('928f1b14e00e9614e0c83957529e6c208703189419979058cb91c4eb86f5b337')

prepare() {
  cd "$pkgname-$pkgver"

  # Set version in About dialog
  sed -i "s/__DEB_VERSION__/${pkgver//+*/}/g" "usr/lib/$pkgname/$pkgname.py"

  # Fix license path
  sed -i 's|common-licenses/GPL|licenses/common/GPL/license.txt|g' \
    "usr/lib/$pkgname/$pkgname.py"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r usr "$pkgdir"
}
