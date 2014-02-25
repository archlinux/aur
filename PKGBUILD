# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=go-xmpp-client
_gitname=xmpp-client
pkgver=99.5e5d916
pkgrel=1
pkgdesc="A simple XMPP client wth OTR support written in pure Go"
arch=('i686' 'x86_64')
url="https://github.com/agl/xmpp-client"
license=('unknown')
depends=('go')
makedepends=('git' 'mercurial')
conflicts=('go-xmpp-client-git')
replaces=('go-xmpp-client-git')
options=('!strip' '!emptydirs')
source=('git+https://github.com/agl/xmpp-client.git')
sha256sums=('SKIP')
_gourl=github.com/agl/xmpp-client

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -v -x ${_gourl}/...
}

check() {
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}/...
}

package() {
  cd "$srcdir"
  install -Dm755 bin/xmpp-client "${pkgdir}/usr/bin/xmpp-client"
}

# vim:set ts=2 sw=2 et:
