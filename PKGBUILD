# Maintainer: Mike Javorski <mike dot javorski at gmail dot com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
# Contributor: Jochen Schalanda <jochen+aur (at) schalanda.name>
pkgname=debianutils
pkgver=4.11.2
pkgrel=1
pkgdesc="Miscellaneous utilities specific to Debian"
arch=('i686' 'x86_64')
url="http://packages.qa.debian.org/d/debianutils.html"
license=('GPL')
depends=('run-parts' 'which')
source=("http://cdn-fastly.deb.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha512sums=('0bd9098beee78b3c8dae839f0c29e9f142cbb22f2ced473cf7ae47a14d9493ba882c1829eba213780392a87a3223b3689729754c8ded80a091efaef3f6f903fd')

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install

  msg 'Remove files of "which" and "run-parts" package...'
  cd -
  find "${pkgdir}" -name which* -delete
  find "${pkgdir}" -name run-parts* -delete
}
