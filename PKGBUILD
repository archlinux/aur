# Maintainer: Nathan Chere <git@nathanchere.com.au>
pkgname=sddm-sugar-candy-git
pkgver=1.6r42.d31dbf5
pkgrel=1
pkgdesc="Sugar Candy is the sweetest login theme available for the SDDM display manager."
arch=('any')
url='https://store.kde.org/p/1312658/'
license=('GPL3')
depends=('sddm' 'qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg')
makedepends=('git')
provides=("sddm-sugar-candy")
conflicts=("sddm-sugar-candy")
backup=('usr/share/sddm/themes/sugar-candy/theme.conf')
source=('sugar-candy::git+https://github.com/Kangie/sddm-sugar-candy.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/sugar-candy"
    printf "1.6r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/sugar-candy"
  install -Dm644 "Main.qml" "$pkgdir/usr/share/sddm/themes/sugar-candy/Main.qml"
  install -Dm644 "theme.conf" "$pkgdir/usr/share/sddm/themes/sugar-candy/theme.conf"
  install -Dm644 "metadata.desktop" "$pkgdir/usr/share/sddm/themes/sugar-candy/metadata.desktop"
  find ./Assets -type f -exec install -Dm644 {} "$pkgdir/usr/share/sddm/themes/sugar-candy/{}" \;
  find ./Backgrounds -type f -exec install -Dm644 {} "$pkgdir/usr/share/sddm/themes/sugar-candy/{}" \;
  find ./Components -type f -exec install -Dm644 {} "$pkgdir/usr/share/sddm/themes/sugar-candy/{}" \;
  install -Dm 644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
