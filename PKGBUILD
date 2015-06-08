# myswiat - mariusz
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lxappearance-git
pkgver=0.5.5.22.g6dc8b82
pkgrel=1
url="http://pcmanfm.sourceforge.net/"
pkgdesc="standard screen manager of LXDE"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'gtk3' 'glib2' 'menu-cache')
makedepends=('git' 'intltool' 'pkgconfig' 'autoconf' 'perl' 'gtk-doc')
provides=('lxappearance')
conflicts=('lxappearance')
source=("git://pcmanfm.git.sourceforge.net/gitroot/lxde/lxappearance")
md5sums=('SKIP')
_gitname="lxappearance"

pkgver() {
  cd "$srcdir/lxappearance"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  ./configure --prefix="/usr" --sysconfdir="/etc" --enable-man --disable-gtk2
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR=${pkgdir} install
}
