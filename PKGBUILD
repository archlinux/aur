# Maintainer: Felipe Weckx <felipe@weckx.net>

pkgname=libtelnet
pkgver=0.21
pkgrel=3
pkgdesc="Simple RFC-complient TELNET implementation as a C library."
url="http://github.com/seanmiddleditch/libtelnet"
license=('custom')
arch=('i686' 'x86_64')
depends=('')
makedepends=('make' 'patch' 'libtool' 'pkg-config' 'autoconf' )
source=("https://github.com/seanmiddleditch/libtelnet/archive/${pkgver}.tar.gz"
        libtelnet-autoconf-2.6.patch)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../libtelnet-autoconf-2.6.patch
  libtoolize --force
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname}/
  install -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/
}

md5sums=('73f66c693c23daa10bf65976f47b7f4b'
         '8d860d0649aefbf455b6d6e6bde599a3')
