# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=jpeg2pdf
pkgver=1.1
pkgrel=1
pkgdesc='Cross-platform command-line tool for creation of PDF documents from scans/photos of pages in JPEG (.jpg) format and the lightest weight ANSI C library to put multiple JPEG files into one PDF file'
arch=('x86_64')
url='https://sourceforge.net/projects/jpeg2pdf'
license=('GPL')
depends=('ghostscript' 'poppler')
source=("${pkgname}-${pkgver}.tar.bz2::https://sourceforge.net/projects/jpeg2pdf/files/${pkgver}/jpeg2pdf_${pkgver}_src.zip/download")
sha256sums=('544037dc64888ccc57c44527d57571a7eefc5fad0e32e5813f0c42c74c08932e')

prepare() {
  sed -i "220achar **filesarray = NULL;" testMain.c
  sed -i "492s|.*|insertJPEGFile(globbuf.gl_pathv[globindex], sb.st_size, pdfId, pageOrientation, ScaleFit, cropHeight, cropWidth);|" testMain.c
}

build() {
  make
}

package() {
  install -Dm755 jpeg2pdf -t "${pkgdir}/usr/bin"
}
# vim:set ts=2 sw=2 et: