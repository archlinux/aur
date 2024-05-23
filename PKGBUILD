# Maintainer:
# Contributor: Pratik Pingale <pratikbpingale9075@gmail.com>

_pkgname="boo-sddm"
pkgname="$_pkgname-git"
pkgver=r33.3377e4c
pkgrel=3
pkgdesc="A dark SDDM theme based on Corners"
url="https://github.com/PROxZIMA/boo-sddm"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'sddm'
  'qt5-graphicaleffects'
  'qt5-svg'
  'qt5-quickcontrols2'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgsrc"

  install -Dm644 assets/sddm.png "$pkgdir/usr/share/sddm/themes/boo/preview.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/sddm/themes/boo/metadata.desktop" << END
[SddmGreeterTheme]
Name=Boo
Description=Boo
Type=sddm-theme
Version=0.0.1
Website=https://github.com/PROxZIMA/boo-sddm
Screenshot=preview.png
MainScript=Main.qml
ConfigFile=theme.conf
Theme-Id=boo
Theme-API=2.0
QtVersion=5
END

  #install -dm755 "$pkgdir/usr/share/sddm/themes/boo"
  cp -r boo/* "$pkgdir/usr/share/sddm/themes/boo/"

  install -dm755 "$pkgdir/usr/share/fonts/TTF/"
  mv "$pkgdir/usr/share/sddm/themes/boo/ChalKDust.ttf" "$pkgdir/usr/share/fonts/TTF/"
}
