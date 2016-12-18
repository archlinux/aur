# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=snowflake-pt-client-git
_gitname=snowflake
pkgver=186.7e9066a
pkgrel=1
pkgdesc="Snowflake is a pluggable transport that proxies traffic through temporary proxies using WebRTC"
arch=('i686' 'x86_64')
url="https://trac.torproject.org/projects/tor/wiki/doc/Snowflake"
license=('BSD')
depends=('libx11')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
source=('git+https://git.torproject.org/pluggable-transports/snowflake.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_gitname/client"
  GOPATH="$srcdir" GOBIN="$PWD" go get -v
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 client/client "${pkgdir}/usr/bin/snowflake-pt-client"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
