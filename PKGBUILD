# Maintainer: Gabriel Núñez Yuvé <gnuy@pm.me>
pkgname=subdivx-get-git
_pkgname=subdivx-get
license=('MIT')
pkgdesc="Download subtitles from subdivx."
pkgver=r84.5f94541
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/gnuy/subdivx-get'
source=('git+git://github.com/gnuy/subdivx-get')
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
  GO111MODULE=on go build -o "$srcdir/bin/subdivx-get"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'subdivx-get' "$pkgdir/usr/bin/subdivx-get"
}
