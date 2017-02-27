# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pamac-tray-appindicator
pkgver=4.2.10
_pkgver=e1a034a535e031ca3f75651e833c0bccf0af950a
pkgrel=2
pkgdesc="Tray icon using appindicator which feets better in KDE"
depends=('pamac' 'libappindicator-gtk3')
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
makedepends=('gettext' 'itstool' 'vala>=0.28' 'libappindicator-gtk3')
options=(!emptydirs)

source=("pamac-$pkgver-$pkgrel.tar.gz::https://github.com/manjaro/pamac/archive/$_pkgver.tar.gz")
sha256sums=('f54a0e5b43e2bf023a21d886351064936d69cd49fee0885dabe4a9c1ad1984c1')
  
prepare() {
  # adjust version string
  cd "$srcdir/pamac-$_pkgver"
  sed -i -e "s|\"$pkgver\"|\"$pkgver-$pkgrel\"|g" src/transaction.vala
  # patches here
}

build() {
  cd "$srcdir/pamac-$_pkgver"

  # build
  make all
}

package() {
  cd "$srcdir/pamac-$_pkgver"
  make use_appindicator=true
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install_pamac-tray-appindicator
}
# vim:set ts=2 sw=2 et:
