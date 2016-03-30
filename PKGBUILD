# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=go-uuid
pkgver=100.f9ab0dc
pkgrel=1
pkgdesc="A pure Go implementation of Universally Unique Identifier (UUID)"
arch=('x86_64' 'i686')
url="https://godoc.org/github.com/satori/go.uuid"
license=('MIT')
depends=('go')
makedepends=('rsync')
options=('!strip' '!emptydirs')
_gourl='github.com/satori/go.uuid'

build() {
  GOPATH="${srcdir}" go get -v -x ${_gourl}
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/lib/go"
  rsync -avz --exclude .git {src,pkg} "${pkgdir}/usr/lib/go"

  install -Dm644 "src/${_gourl}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
