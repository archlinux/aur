# Maintainer: S e r g i o  S c h  n e i d e r <s p s f 6 4 at msn dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=thingy
pkgver=1.1.9
pkgrel=1
pkgdesc="Quickly access recent and favorite documents.XApp, works with many DE's"
arch=('any')
url="https://github.com/linuxmint/thingy"
license=('GPL-3.0 or later')
depends=('libgsf' 'python-gobject' 'python-setproctitle' 'xapp')
optdepends=('libreoffice' 'xreader')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('faba76e42d63af518f1b2c7b5b033ba06d209e5f5d7f08f4887a5411f72dd7c6')

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
