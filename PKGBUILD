# Maintainer:
# Contributor: Francois Menning <f.menning@pm.me>

_pkgname="qogir-gtk-theme"
pkgname="$_pkgname-git"
pkgver=2025.08.17.r8.ge7b3146
pkgrel=2
pkgdesc="Qogir is a flat Design theme for GTK"
url="https://github.com/vinceliuice/Qogir-theme"
license=('GPL-3.0-or-later')
arch=('any')

makedepends=(
  'git'
  'sassc'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="qogir-theme"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgsrc"

  mkdir -pm755 "$pkgdir/usr/share/themes"

  ./install.sh \
    --dest "$pkgdir/usr/share/themes" \
    --theme all \
    --icon arch \
    --tweaks image
}
