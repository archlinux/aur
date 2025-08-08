pkgname=human-theme-gtk
pkgver=2.6.0
pkgrel=1
pkgdesc="Human theme for GTK"
arch=('any')
url='https://github.com/luigifab/human-theme'
license=('GPL3' 'LGPL2' 'CCBYSA')
depends=()
optdepends=('gtk-engine-murrine: for gtk2')
source=("https://github.com/luigifab/human-theme/archive/v${pkgver}/human-theme-${pkgver}.tar.gz")
sha256sums=("3d148e3f3129e9ccf84bec9de491274c4b65cc725822d2cc2e9b63475975d8ab")

prepare() {
  mv "human-theme-$pkgver" "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"

  # the entire source code is GPL-3.0-or-later, except */metacity-1/* which is LGPL-2.1-or-later,
  # and */gtk-2.0/* which is CC-BY-SA-3.0-or-later
  install -dm 755 "$pkgdir/usr/share/themes/"
  cp -a src/human-theme/           "$pkgdir/usr/share/themes/"
  cp -a src/human-theme-blue/      "$pkgdir/usr/share/themes/"
  cp -a src/human-theme-green/     "$pkgdir/usr/share/themes/"
  cp -a src/human-theme-orange/    "$pkgdir/usr/share/themes/"

  install -Dpm 644 data/profile.sh "$pkgdir/etc/profile.d/$pkgname.sh"

  install -Dpm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}