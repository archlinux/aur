# Maintainer: Moritz Lipp <mlq@pwmt.org>

_pkgname=girara

pkgname=girara-git
pkgver=0.2.2.r2.gcf8389d
pkgrel=1
pkgdesc="user interface library"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/girara"
license=('custom')
depends=('gtk3>=3.2' 'glib2>=2.28' 'intltool')
makedepends=('git')
conflicts=('girara')
provides=('girara')
source=("${_pkgname}::git+git://pwmt.org/girara.git#branch=develop")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

pkgver() {
  cd "$_pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
