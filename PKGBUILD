# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-poppler-git
pkgrel=1
pkgver=0.2.5.3.g3037eb4
pkgdesc="PDF support for zathura by using the poppler rendering library"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/zathura-pdf-poppler"
license=('custom')
depends=('zathura-git' 'poppler-glib')
makedepends=('git')
conflicts=('zathura-pdf-mupdf' 'zathura-pdf-mupdf-git' 'zathura-pdf-poppler')
provides=('zathura-pdf-poppler-git' 'zathura-pdf-poppler')
source=('zathura-pdf-poppler::git+https://git.pwmt.org/pwmt/zathura-pdf-poppler.git#branch=develop')
md5sums=('SKIP')
_gitname=zathura-pdf-poppler

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$srcdir/$_gitname"
  local ver="$(git describe --long --always)"
  printf "%s" "${ver//-/.}"
}

# vim:set ts=2 sw=2 et:
