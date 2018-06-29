# Maintainer: Milk Brewster <milk on freenode>
_pkgname=stepseq.lv2
pkgname=${_pkgname}-git
pkgver=r89.94dd4e4
pkgrel=1
pkgdesc="Simple Step Sequencer (also available in community/x42-plugins)"
arch=(x86_64)
url="https://github.com/x42/stepseq.lv2"
license=('GPL')
groups=()
depends=('lv2')
makedepends=('git')
provides=('stepseq.lv2' 'stepseq.lv2-git')
conflicts=('stepseq.lv2' 'stepseq.lv2-git' 'x42-plugins')
install=
source=('git+https://github.com/x42/stepseq.lv2')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/stepseq.lv2"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/stepseq.lv2"
  make submodules
}

build() {
  cd "$srcdir/stepseq.lv2"
	make
}

package() {
  cd "$srcdir/stepseq.lv2"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
