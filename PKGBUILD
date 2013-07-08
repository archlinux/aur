#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=lxpolkit-git
pkgver=0.1.0.21.g42efb56
pkgrel=1
pkgdesc='A simple PolicyKit authentication agent for LXDE'
arch=('i686' 'x86_64')
url="http://lxde.org/"
license=('GPL')
groups=('lxde')
provides=('lxpolkit')
conflicts=('lxpolkit')
depends=('gtk2>=2.12.0' 'polkit')
makedepends=('git' 'intltool')
options=('!emptydirs')

source=('git://lxde.git.sourceforge.net/gitroot/lxde/lxpolkit'
	'automake-1.12.patch'
	'autogen.patch')
md5sums=('SKIP'
         'c8855c4c750e8b60a9870fa3ef23fd29'
         '0d8669579c04cd3f29dbf69a263c8ac4')

_gitname="lxpolkit"

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname

  patch -p1 < ${srcdir}/automake-1.12.patch
  patch -p1 < ${srcdir}/autogen.patch

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}
