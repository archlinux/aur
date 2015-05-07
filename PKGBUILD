# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=nolimips
pkgname=${_pkgname}-git
pkgver=0.9.40.geec6f00
pkgrel=5
pkgdesc='Nolimips is a MIPS-based simulator with "infinitely many registers".'
url="https://www.lrde.epita.fr/wiki/Nolimips"
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('git' 'python2')
depends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.lrde.epita.fr/tiger/$_pkgname.git")
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
