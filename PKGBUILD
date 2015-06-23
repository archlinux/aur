# Maintainer: Leonard de Ruijter <alderuijter@gmail.com>
# Contributor: Matthias Grosser <mtgrosser at gmx dot net>

pkgname=shine-git
pkgver=git
pkgrel=1
pkgdesc='Revived fixed-point MP3 encoder'
arch=('i686' 'x86_64')
url='https://github.com/savonet/shine'
source=($pkgname::git://github.com/savonet/shine.git)
license=(GPL2)
depends=('glibc')
makedepends=('git' 'automake' 'autoconf' 'make' 'libtool')
provides=('shine')
conflicts=('shine')
options=('!libtool' '!strip')
md5sums=('SKIP')
pkgver() {
  cd $pkgname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

prepare() {
	cd $srcdir/$pkgname
 ./bootstrap
}

build() {
	cd $srcdir/$pkgname
	./configure --prefix=/usr
        make all
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR="${pkgdir}" install
}
