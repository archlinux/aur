# Maintainer:

_pkgname="simple-mtpfs"
pkgname="$_pkgname-git"
_srcname='simple-mtpfs'
pkgver=0.4.0.r2.g5dfd25c
pkgrel=1
pkgdesc="A FUSE filesystem that supports reading/writing from MTP devices"
url="https://github.com/phatina/simple-mtpfs"
license=('GPL-2.0-or-later')
arch=('x86_64' 'i686')

depends=(
  'libmtp'
  'fuse'
  #'gcc-libs'
)
makedepends=(
  'autoconf-archive'
  'git'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  autoreconf --install --force --warnings='all'
  ./configure --prefix='/usr'
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="${pkgdir}" install
}
