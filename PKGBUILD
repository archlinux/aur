# Maintainer: a821
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf-git
pkgrel=1
pkgver=2026.02.03.r1.g6869e44
pkgdesc="PDF support for zathura (mupdf backend) (Supports PDF, ePub, and OpenXPS)"
arch=('x86_64')
url="https://pwmt.org/projects/zathura-pdf-mupdf"
license=('Zlib')
depends=('cairo' 'girara-git' 'glib2' 'libmupdf' 'zathura-git')
makedepends=('git' 'meson' 'ninja')
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
  arch-meson build -Dtests=disabled
  ninja -C build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
