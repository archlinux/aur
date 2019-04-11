pkgname=kompose-git
__gitroot=github.com/kubernetes/kompose
pkgver=r1220.fb7a92ca
pkgrel=1
pkgdesc="kompose takes a Docker Compose file and translates it into Kubernetes resources (git version)."
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://${__gitroot}"
license=('apache')
depends=( )
makedepends=('git' 'go')
provides=('kompose')
conflicts=('kompose' 'kompose-bin')
_gourl=$__gitroot
source=("$pkgname::git+https://${__gitroot}")
sha256sums=('SKIP')

build() {
  GOPATH="$srcdir" go get -v -x ${_gourl}
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
