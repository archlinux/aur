# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=go-graphql-go
pkgver=361.26c58bd
pkgrel=1
pkgdesc="GraphQL for Go"
arch=('x86_64' 'i686')
url="https://github.com/graphql-go/graphql"
license=('MIT')
depends=('go')
makedepends=('rsync')
options=('!strip' '!emptydirs')
_gourl='github.com/graphql-go/graphql'

build() {
  GOPATH="${srcdir}" go get -v -x ${_gourl}
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/lib/go"
  rsync -avz --exclude .git {src,pkg} "${pkgdir}/usr/lib/go"

  install -Dm644 "src/${_gourl}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
