# Maintainer: Noel Kuntze <noel@familie-kuntze.de>

pkgname=pcs-git
_pkgname=pcs
pkgver=0.9.155.r26.ge2d32f1
pkgrel=1
pkgdesc='pacemaker corosync shell utility for cluster configuration'
arch=('any')
url='http://clusterlabs.org/'
license=('GPL2')
depends=('python')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/ClusterLabs/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long|sed -E 's,^[^0-9]*,,;s,-([0-9]*),.r\1,;s,-,.,g'
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}
