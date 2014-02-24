# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

pkgname=cloudprint-cups-git
pkgver=20140210.66.gddd00d5
pkgrel=1
epoch=1
pkgdesc="Google Cloud Print driver for CUPS, allows printing to printers hosted on Google Cloud Print."
arch=('any')
url="https://github.com/simoncadman/CUPS-Cloud-Print"
license=('GPL3')
depends=('pycups' 'python2-httplib2')
makedepends=('cups' 'git')
provides=('cloudprint-cups' 'cupscloudprint')
conflicts=('cloudprint-cups' 'cupscloudprint')
options=(!emptydirs)
install=cloudprint-cups.install
source=("${pkgname}::git://github.com/simoncadman/CUPS-Cloud-Print.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --always --tags | sed 's|-|.|g'
}

build() {
  cd ${srcdir}/${pkgname}
  ./configure --prefix /usr
  make
}

package() {
  cd ${srcdir}/${pkgname}
  NOPERMS=1 make DESTDIR=${pkgdir} install
}
