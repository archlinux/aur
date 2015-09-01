pkgname=seaweedfs-git
__gitroot=github.com/chrislusf/seaweedfs
pkgver=912.7d1e9a6
pkgver() {
  cd $srcdir/src/$__gitroot && \
    echo $(git rev-list --count master).$(git rev-parse --short master) || \
    echo "null"
}
pkgrel=1
pkgdesc="Seaweed-FS is a simple and highly scalable distributed file system, written on Go."
arch=('i686' 'x86_64')
url="https://github.com/chrislusf/seaweedfs"
license=('APACHE')
depends=( )
makedepends=('git' 'go' 'mercurial')
provides=('seaweedfs')
conflicts=('seaweedfs')
_gourl=$__gitroot/go/weed

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

# vim:set ts=2 sw=2 et:
