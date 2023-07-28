# Maintainer:
# Contributor: Francois Menning <f.menning@pm.me>

_gitname="qogir-theme"
_pkgname="qogir-gtk-theme"
pkgname="$_pkgname-git"
pkgver=2023.05.24.r6.ga25bc47
pkgrel=1
pkgdesc='Qogir is a flat Design theme for GTK'
arch=('any')
url='https://github.com/vinceliuice/Qogir-theme'
license=('GPL3')

depends=(
  'gtk-engine-murrine'
  'gtk-engines'
  'gtk3'
  'gtk4'
)
makedepends=(
  'git'
  'sassc'
)

optdepends=(
  'qogir-icon-theme: Matching icon theme'
)

provides=('qogir-gtk-theme')
conflicts=('qogir-gtk-theme')

source=(
  "$_gitname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

_pkgsrc="$_gitname"
pkgver() {
  cd "$srcdir/$_pkgsrc"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgsrc"

  install -dm755 "$pkgdir/usr/share/themes"
  
  ./install.sh \
    --dest "$pkgdir/usr/share/themes" \
    --theme all \
    --icon arch \
    --libadwaita \
    --tweaks image
}
