# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-cb-git
pkgrel=1
pkgver=0.1.2.3.ge2958f3
pkgdesc="Comic book support for zathura"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/zathura/plugins/zathura-cb"
license=('custom')
depends=('zathura-git')
makedepends=('git')
conflicts=('zathura-cb')
provides=('zathura-cb')
optdepends=(
  'unrar: For *.cbr support'
  'unzip: For *.cbz support'
  'p7zip: For *.cb7 support'
  'tar:   For *.cbt support'
)
source=('zathura-cb::git+git://pwmt.org/zathura-cb.git#branch=develop')
md5sums=('SKIP')
_gitname=zathura-cb

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
