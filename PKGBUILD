# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=thingy
pkgver=1.0.7
pkgrel=1
pkgdesc="Utility application used to make collections and quickly access recent and favorite documents."
arch=('any')
url="https://github.com/linuxmint/thingy"
license=('GPL3')
depends=('libgsf' 'python-gobject' 'python-setproctitle' 'xapp')
optdepends=('libreoffice' 'xreader')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('675699fb11954cd685115702bd1d133aa1c4ec1ce185c38a58d40bf62a8d86b5')

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
