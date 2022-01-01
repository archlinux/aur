# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=sticky
pkgver=1.8
pkgrel=1
pkgdesc="A sticky notes app for the Linux desktop"
arch=('any')
url="https://github.com/linuxmint/sticky"
license=('GPL')
depends=('gtk3' 'gspell' 'python-gobject' 'python-xapp' 'xapp')
provides=("sticky")
conflicts=("sticky-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f96a108a5c4dceee02e631b075e6e260dedb15a0d0506660c158e4b62d8a1486')

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

