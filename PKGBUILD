# Maintainer: Brent Carmer <bcarmer@gmail.com>
# Co-maintainer: Alex J. Malozemoff <amaloz@galois.com>

pkgname=saw-script-git
_pkgname=saw-script

pkgver=r2688.75c7fd76
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgrel=1
pkgdesc="The Software Analysis Workbench"
url="https://saw.galois.com/"
arch=('x86_64')
license=('noncommercial')
depends=('ncurses' 'z3')
makedepends=('stack' 'perl')
conflicts=('saw-script')
provides=('saw-script')
source=('git://github.com/GaloisInc/saw-script.git')
sha1sums=('SKIP')

build() {
  cd "$srcdir/${_pkgname}"
  ln -sf stack.ghc-8.4.yaml stack.yaml
  ./build.sh
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname
  cp bin/saw $pkgdir/usr/bin
  cp LICENSE $pkgdir/usr/share/licenses/$_pkgname
}
