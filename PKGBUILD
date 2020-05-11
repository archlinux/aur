# Maintainer: Milk Brewster <milk on freenode>
_pkgname=stegosaurus-lv2
pkgname=${_pkgname}-git
pkgver=r18.543a95d
pkgrel=1
pkgdesc="lv2 drum synthersizer without sampling (patched fork)"
arch=(x86_64)
url="https://github.com/mxmilkiib/stegosaurus"
license=('GPL')
groups=()
depends=('lv2' 'cairo')
makedepends=('git')
provides=()
conflicts=()
install=
source=('git+https://github.com/mxmilkiib/stegosaurus')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/stegosaurus"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/stegosaurus"
  ./waf configure --prefix=/usr
}

build() {
  cd "$srcdir/stegosaurus"
  ./waf
}

package() {
  cd "$srcdir/stegosaurus"
  # make PREFIX=/usr DESTDIR="$pkgdir/" install
  ./waf install --destdir=$pkgdir
}
