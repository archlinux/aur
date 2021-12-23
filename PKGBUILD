# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=sticky
pkgver=1.5
pkgrel=1
pkgdesc="A sticky notes app for the Linux desktop"
arch=('any')
url="https://github.com/linuxmint/sticky"
license=('GPL')
depends=('gtk3' 'gspell' 'python-gobject' 'python-xapp' 'xapp')
provides=("sticky")
conflicts=("sticky-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6db1e86fe47ed39145b55fba5f9b78514e0069775108e1bffcce7d60f10b9c24')

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
  cp -r etc usr "$pkgdir"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}

