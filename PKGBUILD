pkgname=jsonpp-git
pkgver=null
pkgver() {
  cd $srcdir/src/github.com/chrislusf/seaweedfs && \
    echo $(git rev-list --count master).$(git rev-parse --short master) || \
    echo "null"
}
pkgrel=1
pkgdesc="Simple command line JSON pretty printer. Written on Go."
arch=('i686' 'x86_64')
url="http://jmhodges.github.io/jsonpp/"
license=('custom')
depends=( )
makedepends=('git' 'go')
provides=('jsonpp')
conflicts=('jsonpp')
_gourl=github.com/jmhodges/jsonpp

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

