# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Noel Kuntze <noel@familie-kuntze.de>

pkgname=pcs
pkgver=0.9.157
pkgrel=1
pkgdesc='pacemaker corosync shell utility for cluster configuration'
arch=('any')
url='http://clusterlabs.org/'
license=('GPL2')
depends=('python' 'python-lxml')
makedepends=('ruby-bundler')
source=("https://github.com/ClusterLabs/$pkgname/archive/$pkgver.tar.gz")
md5sums=('9e235349882b3090d4a9f09ffdd4656b')

build() {
  cd $pkgname-$pkgver
  make -C pcsd BUILD_GEMS=true build_gems
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" BUILD_GEMS=false install install_pcsd
  rm -fr "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

# vim: set sw=2 et:
