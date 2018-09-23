# Maintainer: Florian Schweikert <kelvan@ist-total.org>
# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>
pkgname=pict-git
_pkgname=pict
pkgver=55.8d9d7d7
pkgrel=1
pkgdesc='Tool for pairwise automation: Pairwise Independent Combinatorial Testing'
arch=('x86_64' 'i686')
url='https://github.com/Microsoft/pict'
license=('MIT')
depends=()
makedepends=('gcc' 'make')
source=("git+https://github.com/Microsoft/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package(){
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/bin/"
  install -m755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
