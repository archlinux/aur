# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: kevku <kevku@msn.com>
# Contributor: Rene Pärts <rene87@hot.ee>
pkgname=libp11
pkgver=0.3.1
pkgrel=1
pkgdesc="A library implementing a small layer on top of the PKCS11 API"
arch=('i686' 'x86_64')
url="http://www.opensc-project.org/"
license=('LGPL')
# libtool is required at runtime as it uses libltdl
depends=('openssl' 'libtool')
source=("https://github.com/OpenSC/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c396ceed83319f6ef6a479190e442c5ad7274514d0784c3e1f3b391b35e7d9b3')


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
