# Contributor: eagletmt <eagletmt@gmail.com>
# Maintainer: kaptoxic

pkgname=teyjus
pkgver=2.1
pkgrel=1
pkgdesc='An efficient implementation of the higher-order logic programming language Lambda Prolog'
url='http://teyjus.cs.umn.edu/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('glibc')
makedepends=('ocaml' 'omake' 'flex' 'bison')
source=(https://github.com/teyjus/teyjus/archive/v${pkgver/_/-}.tar.gz)

build () {
  cd "$srcdir/$pkgname-$pkgver"
  omake
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  local bin
  for bin in tjcc tjdepend tjdis tjlink tjsim
  do
    install -m755 $bin "$pkgdir/usr/bin/"
  done

  mkdir -p "$pkgdir/usr/share/emacs/site-lisp"
  install -m644 emacs/teyjus.el "$pkgdir/usr/share/emacs/site-lisp/"
}

# vim:set ts=2 sw=2 et:
md5sums=('e146dc66f1c526d3906112cc5edfb93c')
