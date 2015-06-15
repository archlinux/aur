# Maintainer: Moritz Lipp <mlq@pwmt.org>

_pkgname=libzathura

pkgname=libzathura-git
pkgver=49ca31e
pkgrel=1
pkgdesc="A document library."
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/libzathura"
license=('custom')
depends=('glib2>=2.28' 'intltool' 'file')
makedepends=('git')
checkdepends=('check' 'libfiu')
conflicts=('libzathura')
provides=('libzathura')
source=("${_pkgname}::git+git://pwmt.org/libzathura.git#branch=develop")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  make
}

check() {
  cd "$srcdir/$_pkgname"
  make test || return 0
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
