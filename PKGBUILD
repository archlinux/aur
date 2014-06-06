#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=lxpolkit-git
pkgver=0.1.0.34.g55fc5d4
pkgrel=2
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

source=("$pkgname::git://lxde.git.sourceforge.net/gitroot/lxde/lxpolkit")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd $pkgname
  sed -e '/AM_INIT_AUTOMAKE/s,-Werror,,' -i configure.ac
  sed -e '/AM_INSTALLED_VERSION/s,1.11,1.14,' -i autogen.sh
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}
