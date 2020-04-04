# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Bram Swenson <bram@amplified.work>

pkgname=concourse
pkgver=6.0.0
pkgrel=2
pkgdesc="Concourse is a container-based continuous thing-doer written in Go and Elm"
arch=('x86_64')
url='https://concourse-ci.org'
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/concourse/concourse/archive/v${pkgver}.tar.gz")
makedepends=('go')
md5sums=('98d3458860dfed6bd83278e5fc343508')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/concourse"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -v -o "${srcdir}/${pkgname}-bin"
}

package() {
  install -Dm755 "${pkgname}-bin" "${pkgdir}/usr/bin/concourse"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  go clean -modcache #Remove go libraries
}
