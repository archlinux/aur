pkgname=human-theme-gtk
pkgver=3.2.0
pkgrel=1
pkgdesc='Human theme for GTK'
url='https://github.com/luigifab/human-theme'
license=('GPL3' 'LGPL2' 'CCBYSA')
arch=('any')
optdepends=('gtk-engine-murrine: for gtk2' 'qt5-style-globalqss: for qt5' 'qt6-style-globalqss: for qt6')
source=("https://github.com/luigifab/human-theme/archive/v${pkgver}/human-theme-${pkgver}.tar.gz")
sha256sums=('2b45568ac8fa95b69da65d8ec030436388227e6ea36ad3270e6144394f01d5e3')

prepare() {
  mv "human-theme-$pkgver" "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dpm 644 data/profile.sh "$pkgdir/etc/profile.d/$pkgname.sh"

  # the entire source code is GPL-3.0-or-later, except */metacity-1/* which is LGPL-2.1-or-later,
  # and */gtk-2.0/* which is CC-BY-SA-3.0-or-later
  install -dm 755 "$pkgdir/usr/share/themes/"
  cp -a src/Human/           "$pkgdir/usr/share/themes/"
  cp -a src/Human-blue/      "$pkgdir/usr/share/themes/"
  cp -a src/Human-green/     "$pkgdir/usr/share/themes/"
  cp -a src/Human-orange/    "$pkgdir/usr/share/themes/"

  install -Dpm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  #install -Dpm 644 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}