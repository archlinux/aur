pkgname=supercronic-git
__gitroot=github.com/aptible/supercronic
pkgver=r226.afb376d
pkgrel=1
pkgdesc="Supercronic is a crontab-compatible job runner, designed specifically to run in containers."
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://github.com/aptible/supercronic"
license=('MIT')
makedepends=('git' 'go' 'bash-bats')
provides=('supercronic')
conflicts=('supercronic')
_gourl=$__gitroot
source=("$pkgname::git+https://${__gitroot}")
sha256sums=('SKIP')

build() {
  GOPATH="$srcdir" go get -v -d ${_gourl}
  cd "$srcdir/$pkgname"
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/$pkgname/supercronic" "$pkgdir/usr/bin/"
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
