# Maintainer: Mike Javorski <mike dot javorski at gmail dot com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
# Contributor: Jochen Schalanda <jochen+aur (at) schalanda.name>
pkgname=debianutils
pkgver=5.23.2
pkgrel=1
pkgdesc="Miscellaneous utilities specific to Debian"
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/debianutils"
license=('GPL')
makedepends=('po4a')
provides=('run-parts')
conflicts=('run-parts')
source=("https://salsa.debian.org/debian/$pkgname/-/archive/debian/$pkgver/$pkgname-debian-$pkgver.tar.bz2")
sha512sums=('52bbdff0dd9735088b1ef196ce57a369656e7ff6957550575c73b792dfaf4d72974b6016f1326357f2fde82e634d47600e00884f66faf93f416402284d12f216')

build() {
  cd "${srcdir}/${pkgname}-debian-${pkgver}"
  autoreconf -fi
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-debian-${pkgver}"
  make DESTDIR="$pkgdir" install
  cd -

  echo 'Remove conflicting "installkernel" files...'
  find "${pkgdir}" -name installkernel* -delete
}
