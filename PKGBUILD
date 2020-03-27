# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-git
pkgver=0.4.5.28.g3b4540f
pkgrel=2
pkgdesc="a document viewer"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/zathura"
license=('custom')
depends=('girara-git' 'gtk3>=3.10' 'cairo>=1.8.8')
makedepends=('git' 'python-sphinx' 'intltool' 'meson')
checkdepends=('check')
conflicts=('zathura')
provides=('zathura')
source=('zathura::git+https://git.pwmt.org/pwmt/zathura.git#branch=develop')
md5sums=('SKIP')
_gitname=zathura

optdepends=(
  'zathura-pdf-poppler-git: PDF support by using poppler'
  'zathura-pdf-mupdf-git: PDF support by using mupdf'
  'zathura-djvu-git: djvu support by using djvulibre'
  'zathura-ps-git: PostSctipt support by using libspectre'
  'fish'
  'bash-completion'
)

prepare() {
  mkdir -p build
}

build() {
  cd build
  meson --prefix=/usr --buildtype=release $srcdir/$_gitname
  ninja
}

check() {
  cd build
  ninja test
}

package() {
  cd build
  DESTDIR="$pkgdir/" ninja install
}

pkgver() {
  cd "$_gitname"
  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

# vim:set ts=2 sw=2 et:
