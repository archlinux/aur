# Maintainer:
# Contributor: Barry Smith <brrtsm at gmail dot com>

## links
# https://packages.qa.debian.org/u/urlview.html
# https://sr.ht/~nabijaczleweli/urlview-ng/

_pkgname="urlview"
pkgname="$_pkgname-git"
pkgver=1e.r1.g3041065
pkgrel=1
pkgdesc="A curses URL parser for text files"
url="https://git.sr.ht/~nabijaczleweli/urlview-ng"
license=('0BSD' 'GPL-2.0-or-later')
arch=('x86_64' 'i686' 'armv7h' 'aarch64')

depends=(
  'bash'
  'glibc'
  'ncurses'
)
makedepends=(
  'git'
)

conflicts=("$_pkgname")
provides=("$_pkgname")

options=('!debug')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url")
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
  DESTDIR="$pkgdir" PREFIX='/usr' make install

  install -Dm644 'LICENSES/0BSD.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.0BSD"
  install -Dm644 'LICENSES/GPL-2.0-or-later.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL-2.0-or-later"
}
