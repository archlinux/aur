# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-git
pkgver=0.2.9.2.g1eec4a6
pkgrel=1
pkgdesc="a document viewer"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/zathura"
license=('custom')
depends=('girara-git' 'gtk3>=3.10' 'cairo>=1.8.8')
makedepends=('git' 'python-docutils' 'intltool')
conflicts=('zathura')
provides=('zathura')
source=('zathura::git+git://pwmt.org/zathura.git#branch=develop')
md5sums=('SKIP')
_gitname=zathura

optdepends=(
  'zathura-pdf-poppler-git: PDF support by using poppler'
  'zathura-pdf-mupdf-git: PDF support by using mupdf'
  'zathura-djvu-git: djvu support by using djvulibre'
  'zathura-ps-git: PostSctipt support by using libspectre'
)

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
  cd "$_gitname"
  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

# vim:set ts=2 sw=2 et:
