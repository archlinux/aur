# Maintainer:  dreieck
# Contributor: Diejmon

pkgname=gtk-theme-clearlooks-compact
pkgver=2019.01.12
pkgrel=3
pkgdesc="A compact clearlooks theme for GTK2, GTK3, Metacity, Xfwm4."
arch=('any')
url="https://www.gnome-look.org/p/1284820/"
license=('GPL3')
depends=()
makedepends=(
  'jq'
  'perl'
)
optdepends=(
  'gtk2:     To use the theme in GTK2.'
  'gtk3:     To use the theme in GTK3.'
  'metacity: To use the theme in Metacity.'
  'xfwm4:    To use the theme in Xfwm4.'
)
provides=(
  'gtk-clearlooks-compact'
)
conflicts=(
  'gtk-clearlooks-compact'
)
replaces=()

_themearchive="$(curl -Lfs "${url}/loadFiles" | jq -r '.files | .[] | select(.version == "'"${pkgver}"'").url' | perl -pe 's/\%(\w\w)/chr hex $1/ge')" # See https://unix.stackexchange.com/a/743991/133286
source=("${_themearchive}")
sha256sums=(
  '8fe98112eb5bc2c675ed6656869932f56b9b59312c89aafd61d9ac53fd1ec976'
)

package() {
  install -dvm755 "${pkgdir}/usr/share/themes/Clearlooks Compact"

  cp -rv "${srcdir}/Clearlooks-compact"/{gtk-2.0,gtk-3.0,metacity-1,xfwm4,index.theme} "${pkgdir}/usr/share/themes/Clearlooks Compact"/

  install -Dvm644 "${srcdir}/Clearlooks-compact/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
