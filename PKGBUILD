# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pamac-tray-appindicator
pkgver=4.3.0
_pkgver=4.3.0
pkgrel=1
pkgdesc="Tray icon using appindicator which feets better in KDE"
depends=('pamac' 'libappindicator-gtk3')
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
makedepends=('gettext' 'itstool' 'vala>=0.28' 'libappindicator-gtk3')
options=(!emptydirs)

source=("pamac-$pkgver-$pkgrel.tar.gz::https://github.com/manjaro/pamac/archive/v$_pkgver.tar.gz")
sha256sums=('e4f5bc91cdfe9e07026339baa31c9ed3f792be7203ca494057c08b1f68c4598a')
  
prepare() {
  # adjust version string
  cd "$srcdir/pamac-$_pkgver"
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/transaction.vala
  # patches here
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
