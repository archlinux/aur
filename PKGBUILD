# Maintainer: Alexander Hunziker <alex.hunziker@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=babl-git
pkgver=0.1.14.2.g746b5b6
pkgrel=1
pkgdesc="babl is a dynamic, any to any, pixel format translation library."
arch=('i686' 'x86_64')
url="http://www.gegl.org/babl"
license=('LGPL3')
groups=()
depends=('glibc')
makedepends=('git')
provides=("babl=${pkgver}")
conflicts=('babl')
replaces=()
backup=()
options=(!libtool)
install=
source=(git://git.gnome.org/babl)
md5sums=('SKIP')
noextract=()
#generate with 'makepkg -g'

_gitroot=GITURL
_gitname=babl

build() {
  cd "$srcdir/$_gitname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "${srcdir}/babl"
  git describe --always | sed -e 's/BABL_//g' -e 's/[_-]/./g'
}
