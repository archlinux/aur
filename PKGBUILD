# Maintainer: Pavel Borzenkov <pavel@voidptr.ru>
pkgname=ploop
pkgver=7.0.38
pkgrel=1
pkgdesc="Disk loopback block device with many features like dynamic resize, snapshots, etc."
url="https://openvz.org/Ploop"
license=('GPL2' 'LGPL2.1')
arch=("x86_64")
source=("git+https://src.openvz.org/scm/ovz/ploop.git#tag=v${pkgver}")
install=ploop.install
depends=('libxml2' 'python' 'libutil-linux' 'bash')
makedepends=('git')
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="$pkgdir/" LIBDIR="/usr/lib" SBINDIR="/usr/bin" USRSBINDIR="/usr/bin" \
	  install
  mkdir -p $pkgdir/usr/lib/tmpfiles.d
  echo "d /var/lock/ploop 0755 root root -" >$pkgdir/usr/lib/tmpfiles.d/ploop.conf
  rm -rf $pkgdir/var
}
