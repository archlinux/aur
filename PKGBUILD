# Mantainer: Jens Staal <staal1978@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=netbsd-fs-utils-git
pkgver=1.00_56_gd704885
pkgrel=1
pkgdesc="File System Access Utilities in Userland on top of the NetBSD Rump kernel"
arch=('i686' 'x86_64')
url="http://rumpkernel.org/"
license=('BSD')
depends=('netbsd-rump-git')
makedepends=('git')
provides=('netbsd-fs-utils')
conflicts=('netbsd-fs-utils')
options=('!libtool')
source=('git://github.com/rumpkernel/fs-utils')
md5sums=('SKIP')

pkgver() {
  cd fs-utils
  git describe --always | sed 's#-#_#g;s#v##'
}

build() {
  cd fs-utils
  ./configure --prefix=/usr --enable-smbfs
  make
}

package() {
  cd fs-utils
  make DESTDIR="$pkgdir" install
}
