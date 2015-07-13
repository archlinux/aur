# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: kevku <kevku@msn.com>
# Contributor: Rene Pärts <rene87@hot.ee>
pkgname=libp11
pkgver=0.2.8
pkgrel=1
pkgdesc="A library implementing a small layer on top of the PKCS11 API"
arch=('i686' 'x86_64')
url="http://www.opensc-project.org/"
license=('LGPL')
# libtool is required at runtime as it uses libltdl
depends=('openssl' 'libtool')
source=("http://downloads.sourceforge.net/project/opensc/libp11/$pkgname-$pkgver.tar.gz")
sha256sums=('a4121015503ade98074b5e2a2517fc8a139f8b28aed10021db2bb77283f40691')


build() {
  cd "$pkgname-$pkgver"
  mkdir -p m4
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  # Yes, it is actually $pkgname-$pkgname-$pkgver, because of the way github
  # generates the tar ball.
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
