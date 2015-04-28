# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=nolimips
pkgname=${_pkgname}-git
pkgver=0.9.40.geec6f00
pkgrel=1
pkgdesc='Nolimips is a MIPS-based simulator with "infinitely many registers".'
url="https://www.lrde.epita.fr/wiki/Nolimips"
arch=('x86_64' 'i686')
license=('GPLv3')
makedepends=('git')
depends=('python2' 'flex' 'bison')
source=("git://git.lrde.epita.fr/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|nolimips-||;s|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"

  # change interpreter with python2
  find . -name '*.py' | xargs sed -i 's/python$/python2/'
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

check() {
  cd "$srcdir/$_pkgname"
  make check
}

# vim:set sts=2 sw=2 et:
