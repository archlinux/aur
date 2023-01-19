# Maintainer: Markus Hartung <mail@hartmark.se>

_pkgname=entr
pkgname=entr-git
pkgver=r528.828a2a4
pkgrel=1
pkgdesc="Run arbitrary commands when files change."
arch=('i686' 'x86_64')
url="http://eradman.com/entrproject"
license=('MIT')
depends=('glibc' 'vim' 'tmux')
optdepends=()
makedepends=('git')
conflicts=('entr')
provides=("$_pkgname")
source=(
  "git+https://github.com/eradman/entr.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/entr"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/entr"
  ./configure
  make test
  make
}

package() {
  cd "$srcdir/entr"
  install -Dm755 entr "$pkgdir/usr/bin/entr"
  install -Dm644 entr.1 "$pkgdir/usr/share/man/man1/entr.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/entr-git/LICENSE"
}

# vim:set ts=2 sw=2 et:
