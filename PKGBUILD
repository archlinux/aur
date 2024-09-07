# Maintainer:

## links
# https://docs.xfce.org/apps/gigolo/start
# https://gitlab.xfce.org/apps/gigolo

_pkgname=gigolo
pkgname="$_pkgname-git"
pkgver=0.5.3.r127.g6869f25
pkgrel=1
pkgdesc="Frontend to manage connections to remote filesystems using GIO/GVFS"
url="https://gitlab.xfce.org/apps/gigolo"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'gtk3'
  'gvfs'
)
makedepends=(
  'git'
  'xfce4-dev-tools'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --match='gigolo-*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  ./autogen.sh
  ./configure --prefix=/usr --enable-maintainer-mode
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
}
