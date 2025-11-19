# Maintainer: S e r g i o  S c h  n e i d e r <s p s f 6 4 at msn dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=thingy
pkgver=1.2.2
pkgrel=1
pkgdesc="Quickly access recent and favorite documents.XApp, works with many DE's"
arch=('any')
url="https://github.com/linuxmint/thingy"
license=('GPL-3.0 or later')
depends=('libgsf' 'python-gobject' 'python-setproctitle' 'xapp')
optdepends=('libreoffice' 'xreader')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	'.nvchecker.toml'
)


sha256sums=('09edf837012a615b648e1c70797b1e2f452e0352d55a362d2afd7c5d627f3b61'
            'f5e61395cfa4689ad4fcd205fe36a7e19aa0c3875b436f5a110780250183d329')

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
