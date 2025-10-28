# Maintainer: a821
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf-git
pkgrel=1
pkgver=0.4.5.r1.g50ae2a0
pkgdesc="PDF support for zathura (mupdf backend) (Supports PDF, ePub, and OpenXPS)"
arch=('x86_64')
url="https://pwmt.org/projects/zathura-pdf-mupdf"
license=('Zlib')
depends=('cairo' 'gumbo-parser' 'jbig2dec' 'libjpeg-turbo' 'libmupdf' 'openjpeg2' 'openssl' 'zathura-git')
makedepends=('git' 'meson' 'ninja' 'appstream' 'desktop-file-utils')
conflicts=('zathura-pdf-mupdf' 'zathura-pdf-poppler' 'zathura-pdf-poppler-git')
provides=('zathura-pdf-mupdf')
source=("$pkgname::git+https://github.com/pwmt/zathura-pdf-mupdf.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./g'
}

build() {
  cd "$pkgname"
  arch-meson build
  ninja -C build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
