# Maintainer: Christopher Hillenbrand <chillenb dot lists at gmail dot com>
# Contributor: Doron Behar <doron dot behar at gmail dot com>
# Contributor: Vianney le Clément <vleclement at gmail dot com>

pkgname=jbig2enc
pkgver=0.30
pkgrel=1
pkgdesc="A JBIG2 image encoder"
arch=('i686' 'x86_64')
url="https://github.com/agl/jbig2enc"
license=('Apache')
depends=('gcc-libs' 'leptonica>=1.74' 'libpng' 'libjpeg' 'libtiff')
optdepends=('python: for pdf.py')
provides=('jbig2enc')
conflicts=('jbig2enc-git')
makedepends=('automake' 'libtool' 'gzip')
changelog=CHANGELOG
source=("https://github.com/agl/jbig2enc/archive/refs/tags/$pkgver.tar.gz"
        "jbig2enc.1")
sha256sums=('4468442f666edc2cc4d38b11cde2123071a94edc3b403ebe60eb20ea3b2cc67b'
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

