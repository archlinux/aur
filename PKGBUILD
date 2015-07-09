# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=lib32-unixodbc
pkgver=2.3.2
pkgrel=1
pkgdesc='ODBC is an open specification for providing application developers with a predictable API with which to access Data Sources'
arch=('x86_64')
url='http://www.unixodbc.org/'
license=('GPL2' 'LGPL2.1')
depends=('lib32-libltdl' 'unixodbc')
makedepends=('gcc-multilib')
groups=('pipelight-libs')
source=("http://www.unixodbc.org/unixODBC-$pkgver.tar.gz")
sha256sums=('9c3459742f25df5aa3c10a61429bde51a6d4f11552c03095f1d33d7eb02b5c9a')

build() {
  cd unixODBC-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --sysconfdir='/etc'
  make
}

package() {
  cd unixODBC-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,share}}
}

# vim: ts=2 sw=2 et:
