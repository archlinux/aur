# Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=fb2toepub
pkgver=1.0_4
pkgrel=2
pkgdesc="converter from fb2 to epub"
arch=('i686' 'x86_64')
license=('GPL')
url="http://code.google.com/p/fb2-to-epub-converter/"
depends=('zlib' 'gcc-libs')
makedepends=('flex')
source=("http://fb2-to-epub-converter.googlecode.com/files/${pkgname}-${pkgver}.zip" 'error.cpp.patch' 'make.patch')
sha1sums=('06a10c4ede420ba813bdd9f74d3f58456e381770'
          'c36b701c87a8c91c55a97597bdc0505a8cc48d41'
          '40232421925d3a611eb191e8ac6db583f293c5f6')

build() {
  cd ${srcdir}

  patch -p0 < error.cpp.patch
  # binary required since Makefile has CRLF 	
  patch --binary -p1 < make.patch

  make
}

package() {
  cd ${srcdir}
  install -D -m755 unix_dist/fb2toepub ${pkgdir}/usr/bin/${pkgname}
}
