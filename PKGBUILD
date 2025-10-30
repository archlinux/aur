# Maintainer:
# Contributor: Curve <curve.platin at gmail.com>

_pkgname="nordzy-icon-theme"
pkgname="$_pkgname-git"
pkgver=1.8.7.r10.gb981f11
pkgrel=1
pkgdesc="An icon theme based on WhiteSur and Numix with Nord colors"
url="https://github.com/MolassesLover/Nordzy-icon"
license=('GPL-3.0-only')
arch=('any')

makedepends=('git')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgsrc"
  mkdir -pm755 "$pkgdir/usr/share/icons"
  ./install.sh -g -d "$pkgdir/usr/share/icons" --total

  # delete broken symlinks
  find "$pkgdir" -xtype l -delete
}
