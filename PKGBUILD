# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=crunch-git
pkgver=r4.g99f164f
pkgrel=1
pkgdesc="A wordlist generator where you can specify a standard character set or a character set you specify and generate all possible combinations and permutations"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/crunch-wordlist/"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=("crunch=$pkgver")
conflicts=('crunch')
source=("git+https://git.code.sf.net/p/crunch-wordlist/code")
sha256sums=('SKIP')


pkgver() {
  cd "code"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "code"

  make
}

package() {
  cd "code"

  install -Dm755 "crunch" -t "$pkgdir/usr/bin"
  install -Dm644 "charset.lst" -t "$pkgdir/usr/share/crunch"
  install -Dm644 "crunch.1" -t "$pkgdir/usr/share/man/man1"
}
