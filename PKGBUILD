# Maintainer: D3vil0p3r <vozaanthony[at]gmail[dot]com>

_pkgname=gnome-shell-extension-arc-menu
pkgname="$_pkgname-git"
pkgver=62.r0.g446c923
pkgrel=1
pkgdesc='Application menu extension for GNOME Shell.'
url='https://gitlab.com/arcmenu/ArcMenu'
license=('GPL-2.0-or-later')
arch=('any')

depends=(
  'gettext'
  'gnome-shell'
  'gnome-menus'
  'xdg-user-dirs-gtk'
  'xdg-utils'
)
makedepends=(
  'git'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="arcmenu"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"

  make
}

package() {
  cd "$_pkgsrc"

  make DESTDIR="$pkgdir" install
}
