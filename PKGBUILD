# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Sergio A. Morales <sergiomorales@archlinux.cl>
pkgname=389-adminutil
pkgver=1.1.23
pkgrel=2
pkgdesc="Utility library for 389 administration"
arch=('i686' 'x86_64')
url="http://directory.fedoraproject.org/"
license=('GPL')
depends=('389-ds-base')
source=("https://fedorapeople.org/groups/389ds/binaries/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('d5844b95a8bec9fb5e677e4b5c78489959386fd73d061f13b2096159c0726fec')

build() {
  cd $pkgname-$pkgver

  [[ $CARCH = x86_64 ]] && export USE_64=1
  
  msg2 "Running configure..."
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-rpath \
	      --with-openldap \
	      --with-systemdsystemunitdir=/usr/lib/systemd/system

  msg2 "Running make..."
  make
}

package() {
  cd $pkgname-$pkgver

  msg2 "Running make install..."
  make install DESTDIR="$pkgdir"
}
