# Maintainer:
# Contributor: Francois Menning <f.menning@pm.me>

_gitname="qogir-theme"
_pkgname="qogir-gtk-theme"
pkgname="$_pkgname-git"
pkgver=2025.08.17.r4.g10fb12a
pkgrel=1
pkgdesc='Qogir is a flat Design theme for GTK'
url="https://github.com/vinceliuice/Qogir-theme"
license=('GPL-3.0-or-later')
arch=('any')

makedepends=(
  'git'
  'sassc'
)
optdepends=(
  'gtk-engine-murrine: For GTK2 support'
  'gtk-engines: For GTK2 support'
  'kvantum-theme-qogir-git: Matching Kvantum theme'
  'qogir-icon-theme: Matching icon theme'
  'tela-icon-theme: Recommended icon theme'
  'vimix-cursors: Matching cursor theme'
)

provides=('qogir-gtk-theme')
conflicts=('qogir-gtk-theme')

options=('!strip')

_pkgsrc="$_gitname"
source=("$_pkgsrc"::"git+$url")
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
    --libadwaita \
    --tweaks image
}
