pkgname=seaweedfs-git
__gitroot=github.com/chrislusf/seaweedfs
pkgver=r2225.7d8ce080
pkgrel=2
pkgdesc="Seaweed-FS is a simple and highly scalable distributed file system, written on Go."
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://github.com/chrislusf/seaweedfs"
license=('APACHE')
## coreutils: weed uses `stat` during startup
depends=('coreutils')
makedepends=('git' 'go' 'mercurial' 'gcc')
provides=('seaweedfs')
conflicts=('seaweedfs')
_gourl=$__gitroot/weed
source=("$pkgname::git+https://${__gitroot}")
sha256sums=('SKIP')

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
