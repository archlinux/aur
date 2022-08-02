# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=sticky
pkgver=1.11
pkgrel=1
pkgdesc="A sticky notes app for the Linux desktop"
arch=('any')
url="https://github.com/linuxmint/sticky"
license=('GPL')
depends=('gtk3' 'gspell' 'python-gobject' 'python-xapp' 'xapp')
provides=("sticky")
conflicts=("sticky-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c9df047b4cd106966b02ad5d936a3334fd764dc974680d9117da015c4ce5ce6c')

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

