# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=go-graphql-go
pkgver=r1.a4761b3
pkgrel=1
pkgdesc="GraphQL for Go"
arch=('x86_64' 'i686')
url="https://github.com/graphql-go/graphql"
license=('MIT')
depends=('go')
makedepends=('rsync')
options=('!strip' '!emptydirs')
source=(0001-Fix-default-values-of-input-objects.patch)
sha512sums=('0f09d2ddaca40734f6a0ad5bcd9fd7b1868539335e88d66b592a548e4414993878973ac2560c339bfc5126607fc143d01c3e69b9731d50059441c39606c8a2d2')
_gourl='github.com/graphql-go/graphql'

#pkgver() {
#  cd "${srcdir}/src/github.com/graphql-go"
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
  GOPATH="${srcdir}" go get -v -x ${_gourl}

  cd "${srcdir}"/src/github.com/graphql-go/graphql
  patch < "${srcdir}"/0001-Fix-default-values-of-input-objects.patch
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/lib/go"
  rsync -avz --exclude .git {src,pkg} "${pkgdir}/usr/lib/go"

  install -Dm644 "src/${_gourl}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
