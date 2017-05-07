# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: kevku <kevku@msn.com>
# Contributor: Rene Pärts <rene87@hot.ee>
pkgname=libp11
pkgver=0.4.6
pkgrel=1
pkgdesc="A library implementing a small layer on top of the PKCS11 API"
arch=('i686' 'x86_64')
url="http://www.opensc-project.org/"
license=('LGPL')
# libtool is required at runtime as it uses libltdl
depends=('openssl' 'libtool')
provides=('engine_pkcs11')
replaces=('engine_pkcs11')
source=("https://github.com/OpenSC/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('03d4990c17c8dc1ba18a442a944acca6c03f4a3972be9aea6e727882f2be6d7c')


build() {
  cd "$pkgname-$pkgver"
  mkdir -p m4
  ./configure --prefix=/usr --disable-static
  make V=0
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
