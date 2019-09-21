# Maintainer: aksr <aksr at t-com dot me>
pkgname=nopforth-git
pkgver=r147.03f885c
pkgrel=1
epoch=
pkgdesc="Forth interpreter/compiler"
arch=('i686' 'x86_64')
url="https://github.com/iru-/nopforth"
license=('UNLICENSE')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

#check() {
#  cd "$srcdir/$pkgname"
#  make test
#}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 nop $pkgdir/usr/bin/nop
  install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -D -m644 glossary.txt $pkgdir/usr/share/doc/${pkgname%-*}/glossary.txt
  install -D -m644 notes.txt $pkgdir/usr/share/doc/${pkgname%-*}/notes.txt
  mkdir -p $pkgdir/usr/share/doc/${pkgname%-*}/examples
  cp examples/* "$pkgdir/usr/share/doc/${pkgname%-*}/examples"
  install -D -m644 UNLICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

