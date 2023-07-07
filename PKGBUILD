# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=thingy
pkgver=1.1.3
pkgrel=1
pkgdesc="Utility application used to make collections and quickly access recent and favorite documents."
arch=('any')
url="https://github.com/linuxmint/thingy"
license=('GPL3')
depends=('libgsf' 'python-gobject' 'python-setproctitle' 'xapp')
optdepends=('libreoffice' 'xreader')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b1ddcb1bac2cc9d817b6ff7b4a63b58002e7e49c7091712a93478e8a21f779ff')

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
