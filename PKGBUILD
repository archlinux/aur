# Maintainer: Christopher Hillenbrand <chillenb dot lists at gmail dot com>
# Contributor: Doron Behar <doron dot behar at gmail dot com>
# Contributor: Vianney le Clément <vleclement at gmail dot com>

pkgname=jbig2enc
pkgver=0.32
pkgrel=2
pkgdesc="A JBIG2 image encoder"
arch=('i686' 'x86_64')
url="https://github.com/agl/jbig2enc"
license=('Apache')
depends=('gcc-libs' 'leptonica>=1.74' 'libpng' 'libjpeg.so' 'libtiff')
optdepends=('python: for pdf.py')
makedepends=('automake' 'libtool' 'gzip')
changelog=CHANGELOG
source=("https://github.com/agl/jbig2enc/archive/refs/tags/$pkgver.tar.gz"
        "jbig2enc.1")
sha256sums=('5b3b1c48617e5b1608f916a78038ea867a2c9eb20c2ff34a78a48a243f655c2a'
            '34204c599c53aca551ad762fdf76aff4a1b9067be47cae1005c3ecf66325c29f')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  gzip -c "${srcdir}/jbig2enc.1" > "${srcdir}/jbig2enc.1.gz" 
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="$pkgdir"
  install -dm755 "$pkgdir/usr/share/man/man1"
  install -m644 "${srcdir}/jbig2enc.1.gz" "$pkgdir/usr/share/man/man1"
}

