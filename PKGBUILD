# Maintainer:
# Contributor: Aitor Alonso <contact: https://aalonso.eu>

_pkgname="qogir-icon-theme"
pkgname="$_pkgname-git"
pkgver=2025.02.15.r26.gc633057b
pkgrel=2
pkgdesc="A colorful design icon theme for linux desktops"
url="https://github.com/vinceliuice/Qogir-icon-theme"
license=('GPL-3.0-only')
arch=('any')

depends=()
makedepends=(
  'git'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  sed -e '/gtk-update-icon-cache/d' -i install.sh
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgsrc"
  mkdir -p "$pkgdir/usr/share/icons"
  ./install.sh -d "$pkgdir/usr/share/icons"
}
