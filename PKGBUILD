# Maintainer:
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

## links
# https://packages.qa.debian.org/u/urlview.html
# https://sr.ht/~nabijaczleweli/urlview-ng/

: ${_commit:=243419e2ef22b4c3cfac6f29f4528231964e0082} # 1e

_pkgname="urlview"
pkgname="$_pkgname"
pkgver=1e
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

options=('!debug')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url#commit=$_commit")
sha256sums=('SKIP')

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
