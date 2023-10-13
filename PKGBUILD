# Maintainer: Arthur Deierlein <arthur.deierlein@adfinis.com>

pkgname=sddm-theme-mountain-git
pkgdesc="Mountain theme for SDDM."
pkgver=1.1.0.r0.g9fc83a2
pkgrel=3
arch=('any')
url="https://github.com/c0rydoras/sddm-mountain-theme.git"
license=('GPL3')
depends=('sddm' 'qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg' 'ttf-droid')
makedepends=('git')
provides=("sddm-theme-mountain")
conflicts=("sddm-theme-mountain")
backup=('usr/share/sddm/themes/mountain/theme.conf')
source=('sddm-mountain-theme::git+https://github.com/c0rydoras/sddm-mountain-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/sddm-mountain-theme"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  cd "$srcdir/sddm-mountain-theme"
  install -Dm644 "Main.qml" "$pkgdir/usr/share/sddm/themes/mountain/Main.qml"
  install -Dm644 "theme.conf" "$pkgdir/usr/share/sddm/themes/mountain/theme.conf"
  install -Dm644 "metadata.desktop" "$pkgdir/usr/share/sddm/themes/mountain/metadata.desktop"
  find ./Assets -type f -exec install -Dm644 {} "$pkgdir/usr/share/sddm/themes/mountain/{}" \;
  find ./Backgrounds -type f -exec install -Dm644 {} "$pkgdir/usr/share/sddm/themes/mountain/{}" \;
  find ./Components -type f -exec install -Dm644 {} "$pkgdir/usr/share/sddm/themes/mountain/{}" \;
  install -Dm 644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

