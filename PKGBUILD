# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=tiny
pkgver=20130219
pkgrel=2
pkgdesc="Experiments in creating very small Linux ELF executables."
arch=('i686' 'x86_64')
url="http://www.muppetlabs.com/~breadbox/software/tiny/"
license=('GPL')
makedepends=('nasm')
options=(!strip)
source=(http://www.muppetlabs.com/~breadbox/pub/software/${pkgname}.tar.gz
        tiny.sh)
md5sums=('e535400bd35f3606ae2f5d067989e521'
         'e393c72f9529e5a1bae15bbd449b4637')

build() {
  cd "$srcdir/$pkgname"
  make clean && make
}

package() {
  cd "$srcdir/$pkgname"
  rm Makefile *.asm
  mkdir -p -m755 "$pkgdir/opt/$pkgname" "$pkgdir/etc/profile.d"
  cp -a * "$pkgdir/opt/$pkgname"
  install -D -m755 "$srcdir/tiny.sh" "$pkgdir/etc/profile.d"
}

# vim:set ts=2 sw=2 et:
