# Maintainer: Vianney le Clément <vleclement AT gmail·com>
pkgname=jbig2enc
pkgver=0.28
pkgrel=1
pkgdesc="A JBIG2 image encoder"
arch=('i686' 'x86_64')
url="https://github.com/agl/jbig2enc"
license=('Apache')
depends=('gcc-libs' 'leptonica>=1.68' 'libpng' 'libjpeg' 'libtiff')
optdepends=('python2: for pdf.py')
source=("https://github.com/agl/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's@^#!/usr/bin/python$@#!/usr/bin/env python2@' pdf.py
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make install DESTDIR="$pkgdir"
}
