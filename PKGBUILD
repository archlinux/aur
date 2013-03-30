# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=go-xmpp-client
pkgver=20130330
pkgrel=2
pkgdesc="A simple XMPP client wth OTR support written in pure Go"
arch=('i686' 'x86_64')
url="https://github.com/agl/xmpp-client"
license=('unknown')
depends=('go')
makedepends=('git' 'mercurial')
conflicts=('go-xmpp-client-git')
replaces=('go-xmpp-client-git')
options=('!strip' '!emptydirs')
_gourl=github.com/agl/xmpp-client

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}/...
}

check() {
  source /etc/profile.d/go.sh
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}/...
}

package() {
  source /etc/profile.d/go.sh

  mkdir -p "${pkgdir}/$GOPATH/src/${_gourl}"
  cp -Rv --preserve=timestamps "${srcdir}/src/${_gourl}" \
    "${pkgdir}/$GOPATH/src/${_gourl}"

  install -Dm755 "${srcdir}/bin/xmpp-client" "${pkgdir}/usr/bin/xmpp-client"
}

# vim:set ts=2 sw=2 et:
