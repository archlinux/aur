# Maintainer:
# Contributor: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: éclairevoyant
# Contributor: Brian BIdulock <bidulock@openss7.org>

: ${_build_man_extra=false}

export -n BROWSER EDITOR VISUAL PAGER TERMINAL_EMULATOR

_pkgname="sensible-utils"
pkgname="$_pkgname"
pkgver=0.0.26
pkgrel=1
pkgdesc="Utilities for sensible alternative selection"
url="https://salsa.debian.org/debian/sensible-utils"
license=('GPL-2.0-or-later')
arch=('any')

depends=(
  'bash'
)
makedepends=(
  'po4a'
)
checkdepends=(
  'ed'
  'shellcheck'
)

_pkgsrc="$_pkgname-debian-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/-/archive/debian/$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('ac7c1321168fb800c856cfd3cc35e20416e327579ddff118132fd2f03d664e1b')

build() {
  cd "$_pkgsrc"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$_pkgsrc"
  make -k check || true
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir/" install

  if [ "${_build_man_extra::1}" != "t" ]; then
    rm -rf "$pkgdir/usr/share/man"/[a-z][a-z]/
  fi
}
