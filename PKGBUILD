# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mm-common-git
pkgver=0.9.7.2.g569bfca
pkgrel=1
pkgdesc="The build infrastructure and utilities shared among the GNOME C++ binding libraries"
arch=('any')
url="https://github.com/GNOME/mm-common"
license=('GPL')
depends=('bash')
makedepends=('git' 'wget')
provides=('mm-common')
conflicts=('mm-common')
source=("git://github.com/GNOME/mm-common")
md5sums=('SKIP')
_gitname="mm-common"

pkgver() {
  cd $srcdir/$_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr --enable-network 
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
