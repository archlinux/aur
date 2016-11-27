# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.3.0
pkgrel=5

pkgdesc="PDF support for Zathura (MuPDF backend)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('i686' 'x86_64')
license=('zlib')

conflicts=('zathura-pdf-poppler')

depends=('zathura' 'jbig2dec' 'openjpeg2' 'cairo' 'desktop-file-utils')
makedepends=('libmupdf')

source=(https://pwmt.org/projects/zathura/plugins/download/zathura-pdf-mupdf-$pkgver.tar.gz
        mupdf-1.9.patch
        mupdf-1.10.patch)
sha1sums=('ae0be41ea7c75b8ddc083fe01f1366673ea9751a'
          'f26adb3a7c69cf7a2e957d211e8faffe79c923c7'
          '8adb7223e54c028d33008c1b65efb845cb8e6224')

prepare() {
  patch -d zathura-pdf-mupdf-$pkgver -Np1 < mupdf-1.9.patch
  patch -d zathura-pdf-mupdf-$pkgver -Np1 < mupdf-1.10.patch
}

build() {
  make -C zathura-pdf-mupdf-$pkgver MUPDF_LIB="-lmupdf -lmupdfthird"
}

package(){
  make -C zathura-pdf-mupdf-$pkgver DESTDIR="$pkgdir" install
  install -Dm0644 zathura-pdf-mupdf-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
