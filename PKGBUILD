# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=monoburg
pkgname=${_pkgname}-git
pkgver=1.0.6.12.g111a578
pkgrel=1
pkgdesc='MonoBURG is a tree-rewriting system originating from Mono.'
url='https://www.lrde.epita.fr/wiki/MonoBURG'
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('git')
depends=('glib2')
source=("git://git.lrde.epita.fr/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|monoburg-||;s|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"

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
