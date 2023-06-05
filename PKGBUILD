pkgname=correios-git
_pkgname=correios
pkgver=r18.0d75f6e
pkgrel=1
pkgdesc="Golang client for some Brazilian Post Office (Correios) services"
arch=('i686' 'x86_64')
url='https://github.com/paoloo/correios'
source=('git+https://github.com/paoloo/correios')
depends=()
makedepends=('go')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  GO111MODULE=on go build -o "$srcdir/bin/correios"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'correios' "$pkgdir/usr/bin/correios"
}
