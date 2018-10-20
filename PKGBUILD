# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.3.4
pkgrel=1

pkgdesc="PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('zlib')

conflicts=('zathura-pdf-poppler')

depends=('zathura' 'jbig2dec' 'openjpeg2' 'libjpeg' 'cairo' 'desktop-file-utils' 'openssl')
makedepends=('libmupdf' 'meson' 'ninja')

source=(https://pwmt.org/projects/zathura/plugins/download/zathura-pdf-mupdf-$pkgver.tar.xz)

sha1sums=('f2adf855a67455f4dccd22c61dcf22cde4c5ae2a')

build() {
  cd zathura-pdf-mupdf-$pkgver
  arch-meson -Dlink-external=true build
  ninja -C build
}

package(){
  DESTDIR="$pkgdir" ninja -C zathura-pdf-mupdf-$pkgver/build install
  install -Dm0644 zathura-pdf-mupdf-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
