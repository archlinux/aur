pkgname=tufw-git
_pkgname=tufw
pkgver=v0.1.0.r2.g5f4efdb
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/peltho/tufw'
source=('git+git://github.com/peltho/tufw')
depends=('ufw')
makedepends=('go')
sha1sums=('SKIP')
pkgdesc="Terminal UI for ufw"
license=('MIT')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
  cd "$srcdir/$_pkgname"
  GO111MODULE=on go build -o "$srcdir/bin/tufw" "./cmd/..."
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'tufw' "$pkgdir/usr/bin/tufw"
}
