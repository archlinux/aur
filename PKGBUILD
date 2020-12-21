# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.3.6
pkgrel=4

pkgdesc="PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('zlib')

conflicts=('zathura-pdf-poppler')

depends=('cairo' 'gumbo-parser' 'jbig2dec' 'libjpeg' 'openjpeg2' 'openssl' 'zathura')
makedepends=('libmupdf' 'meson' 'ninja' 'git')

source=(zathura-pdf-mupdf-$pkgver.tar.gz::https://github.com/pwmt/zathura-pdf-mupdf/archive/$pkgver.tar.gz
        https://git.pwmt.org/pwmt/zathura-pdf-mupdf/-/commit/988ad45b1ee0f2dceb269f9016a926e110e8ee21.patch)

sha1sums=('ece4731ee5744433b47d403e03eea89e67906c4f'
          '7fbc8fb6b0840c12114dac51c756bc61c503d08b')

prepare() {
  cd zathura-pdf-mupdf-$pkgver
  patch -p1 <"$srcdir"/988ad45b1ee0f2dceb269f9016a926e110e8ee21.patch
}

build() {
  cd zathura-pdf-mupdf-$pkgver
  arch-meson -Dlink-external=true build
  ninja -C build
}

package(){
  DESTDIR="$pkgdir" ninja -C zathura-pdf-mupdf-$pkgver/build install
  install -Dm0644 zathura-pdf-mupdf-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
