pkgname=go-do-it-git
_pkgname=go-do-it
pkgver=r17.af13ab5
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/hardikkum444/go-do-it'
source=('git+git://github.com/hardikkum444/go-do-it')
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

build(){
  cd "$srcdir/$_pkgname"
  GO111MODULE=on go build -o "$srcdir/bin/go-do-it"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'go-do-it' "$pkgdir/usr/bin/go-do-it"
}
