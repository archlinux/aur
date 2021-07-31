# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.3.7
pkgrel=1

pkgdesc="PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('zlib')

conflicts=('zathura-pdf-poppler')

depends=('cairo' 'gumbo-parser' 'jbig2dec' 'libjpeg' 'openjpeg2' 'openssl' 'zathura')
makedepends=('libmupdf' 'meson' 'ninja' 'git')

source=(zathura-pdf-mupdf-$pkgver.tar.gz::https://pwmt.org/projects/zathura-pdf-mupdf/download/zathura-pdf-mupdf-$pkgver.tar.xz)

sha256sums=('2f00aa682d4d4a6324c9777bf158e51584c77729ec393f3e10343bec936ea21d')

build() {
  cd zathura-pdf-mupdf-$pkgver
  arch-meson -Dlink-external=true build
  ninja -C build
}

package(){
  DESTDIR="$pkgdir" ninja -C zathura-pdf-mupdf-$pkgver/build install
  install -Dm0644 zathura-pdf-mupdf-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
