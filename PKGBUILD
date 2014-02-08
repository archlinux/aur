# Maintainer: jjacky
_pkgname=donnatella
pkgname=$_pkgname-git
pkgver=next
pkgrel=1
pkgdesc="GTK+3 customizable file manager with advanced unique features [GIT]"
arch=('i686' 'x86_64')
url="http://jjacky.com/$_pkgname"
license=('GPL3+')
depends=('gtk3')
optdepends=('gtk3-donnatella: For some advanced GUI features')
makedepends=('git' 'gtk-doc')
source=("git+https://github.com/jjk-jacky/${_pkgname}.git#branch=next")
md5sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --abbrev=4 --dirty | tr - .
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --enable-git-version \
    --enable-gtk-doc --enable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
