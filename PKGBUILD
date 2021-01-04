pkgname=jsonpp-git
_gourl=github.com/jmhodges/jsonpp
pkgver=46.7bc0743
pkgver() {
  cd $srcdir/src/$_gourl && \
    echo $(git rev-list --count master).$(git rev-parse --short master) || echo "$pkgver"
}
pkgrel=2
pkgdesc="Simple command line JSON pretty printer. Written on Go."
arch=('i686' 'x86_64')
url="http://jmhodges.github.io/jsonpp/"
license=('custom')
depends=( )
makedepends=('git' 'go')
provides=('jsonpp')
conflicts=('jsonpp')

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"
  
  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

