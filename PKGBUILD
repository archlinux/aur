# Maintainer: Noel Kuntze <noel@familie-kuntze.de>

pkgname=pcs-git
pkgver=r1281.8982045
pkgrel=1
pkgdesc='pacemaker corosync shell utility for cluster configuration'
arch=('i686' 'x86_64')
url='http://clusterlabs.org/'
license=('GPLv2')
makedepends=('unzip')
depends=('glibc' 'openssl' 'python2')
source=('pcs-git::git+https://github.com/feist/pcs')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/usr/bin
  mv ${pkgdir}/usr/sbin/* ${pkgdir}/usr/bin/
  rmdir ${pkgdir}/usr/sbin
}
