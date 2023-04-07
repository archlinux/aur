# Maintainer: redtide <redtid3@gmail.com>

_pkgname=xputty
_prjname=lib$_pkgname
pkgname=(xputty-git xputty-docs-git )
pkgver=r207.bd55d4b
pkgrel=1
pkgdesc="A damn tiny abstraction Layer to create X11 window/widgets with cairo surfaces"
url=https://github.com/brummer10/$_prjname
arch=(x86_64)
license=(custom:0BSD)
makedepends=(
  git
  xxd-standalone
)
depends=(
  libx11
  cairo
)
conflicts=($_pkgname)
source=(
  $_pkgname::git+$url
)
sha512sums=(
  'SKIP'
)
pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "$srcdir/$_pkgname"
  make
}
package_xputty-git() {
  cd "$srcdir/$_pkgname/Build"
  DESTDIR="$pkgdir/" PREFIX=/usr make install
  cd "$srcdir/$_pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
package_xputty-docs-git() {
  pkgdesc+=" - documentation"
  depends=(doxygen)
 
  cd "$srcdir/$_pkgname"
  doxygen
  install -vdm 755 "$pkgdir/usr/share/doc/xputty/"
  cp -a "docs/html/." "$pkgdir/usr/share/doc/xputty"
}
