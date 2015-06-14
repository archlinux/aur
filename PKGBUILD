# Maintainer: L.G. Sarmiento <lgsarmientop-ala-unal.edu.co>
pkgname=daemonize-git
pkgver=20150110
pkgrel=1
pkgdesc="Command-line utility for running any arbitrary program as a Unix daemon"
url="http://software.clapper.org/daemonize/"
arch=('i686' 'x86_64')
depends=('glibc')
license=('BSD')
provides=("daemonize")
build() {
  [ -d ${srcdir}/${pkgname} ] || mkdir ${srcdir}/${pkgname}

  cd ${srcdir}/${pkgname}
  git clone --depth 1 http://github.com/bmc/daemonize.git .

  ./configure --prefix=/usr
  make -j1 || return 1

}

package() {
#install package
  cd ${srcdir}/${pkgname}
  make DESTDIR=$pkgdir install

  # move things to /usr/bin instead of /usr/sbin

  install -d ${pkgdir}/usr/bin
  mv ${pkgdir}/usr/sbin/* ${pkgdir}/usr/bin/
  rmdir ${pkgdir}/usr/sbin
  
  #install licence
  install -Dm644 ${srcdir}/${pkgname}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENCE
}
