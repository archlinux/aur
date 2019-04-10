pkgname=supercronic-git
__gitroot=github.com/aptible/supercronic
pkgver=r83.41d5ac6
pkgrel=1
pkgdesc="Supercronic is a crontab-compatible job runner, designed specifically to run in containers."
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://github.com/aptible/supercronic"
license=('MIT')
makedepends=('git' 'go' 'dep')
provides=('supercronic')
conflicts=('supercronic')
_gourl=$__gitroot
source=("$pkgname::git+https://${__gitroot}")
sha256sums=('SKIP')

build() {
  GOPATH="$srcdir" go get -v -d ${_gourl}
  cd "$srcdir/src/${__gitroot}"
  GOPATH="$srcdir" dep ensure -vendor-only
  GOPATH="$srcdir" go build -v
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/src/${__gitroot}/supercronic" "$pkgdir/usr/bin/"
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
