# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=onionlink
pkgver=4.c26f0c0
pkgrel=1
pkgdesc="Very simple peer-to-peer file sharing using Onion services"
url="https://github.com/mutantmonkey/onionlink"
arch=('i686' 'x86_64')
license=('WTFPL')
makedepends=('git' 'go')
source=("git+https://github.com/mutantmonkey/onionlink.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$pkgname"
  GOPATH="$srcdir" go get -v -d
  GOPATH="$srcdir" go build
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 onionlink "${pkgdir}/usr/bin/onionlink"
  install -Dm644 COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
