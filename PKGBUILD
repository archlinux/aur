# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Sergio A. Morales <sergiomorales@archlinux.cl>
pkgname=389-adminutil
pkgver=1.1.21
pkgrel=1
pkgdesc="Utility library for 389 administration"
arch=('i686' 'x86_64')
url="http://directory.fedoraproject.org/"
license=('GPL')
depends=('389-ds-base' 'mozldap')
source=("http://directory.fedoraproject.org/sources/$pkgname-$pkgver.tar.bz2")
install=$pkgname.install
sha256sums=('a2f2c811d606bf8da71226ae4fa64322f585160cac415afb73c16ea7d7dab06d')

build() {
  cd $pkgname-$pkgver

  [[ $CARCH = x86_64 ]] && export USE_64=1
  
  msg2 "Running configure..."
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-rpath \
              --with-ldapsdk-inc=/usr/include/mozldap \
              --with-ldapsdk-lib=/usr/lib/mozldap

  msg2 "Running make..."
  make
}

package() {
  cd $pkgname-$pkgver

  msg2 "Running make install..."
  make install DESTDIR="$pkgdir"
}
