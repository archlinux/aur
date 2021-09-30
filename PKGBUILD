# Maintainer: Strykar <strykar@hotmail.com>

pkgname=go-livepeer-git
_pkgname=go-livepeer
pkgver=v0.5.21.r0.g6ea2cf41
pkgrel=1
pkgdesc='Official Go implementation of the Livepeer protocol'
arch=('i686' 'x86_64')
url='https://github.com/livepeer/go-livepeer'
license=('MIT')
source=('git+git://github.com/livepeer/go-livepeer')
depends=('base-devel' 'clang' 'gnutls' 'git' 'curl')
conflicts=('go-livepeer-bin')
provides=('go-livepeer-git')
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
  GO111MODULE=on go build -o "$srcdir/bin/livepeer"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'livepeer' "$pkgdir/usr/bin/livepeer"
}
