# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pamac-tray-appindicator
_pkgver=6.0.3
pkgver=$_pkgver
pkgrel=1
pkgdesc="Tray icon using appindicator which feets better in KDE"
depends=('pamac' 'libappindicator-gtk3')
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
makedepends=('gettext' 'itstool' 'vala>=0.36' 'libappindicator-gtk3')
options=(!emptydirs)

source=("pamac-$pkgver-$pkgrel.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha256sums=('312aa6c932c90e2fc54aedbf88f6cc889007ff40c3e45654ec584687d6b7eac4')

prepare() {
  cd "$srcdir/pamac-$_pkgver"
  # patches here

  # adjust version string
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/manager_window.vala
}

build() {
  cd "$srcdir/pamac-$_pkgver/src"

  # build
  make pamac-tray-appindicator
}

package() {
  cd "$srcdir/pamac-$_pkgver"
  make use_appindicator=true prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install_pamac-tray-appindicator
}
# vim:set ts=2 sw=2 et:
