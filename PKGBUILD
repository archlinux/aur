# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=nameinator
_pkgname=NAMEinator
pkgver=0.0.6
pkgrel=1
pkgdesc='Open-source DNS benchmark utility - successor of namebench'
arch=('x86_64')
url='https://github.com/mwiora/NAMEinator'
license=('Apache')
depends=('bind-tools')
makedepends=('go' 'git')
source=("https://github.com/mwiora/NAMEinator/archive/v${pkgver}/NAMEinator-${pkgver}.tar.gz")
b2sums=('fc679222ca053b533dea74fa838416ef09bb51d56c52e7be7961c0c5e91c7bddb826f8fc8fe06e695a30b3c0f76144eb01afeb2084ff85cef9572fa4a8a28dfd')

build() {
  cd ${_pkgname}-${pkgver}
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd ${_pkgname}-${pkgver}
  install -dm755 "${pkgdir}"/usr/lib/${pkgname} "${pkgdir}"/usr/bin/
  install -Dm755 ${_pkgname} "${pkgdir}"/usr/lib/${pkgname}/${pkgname}
  cp -ar datasrc "${pkgdir}"/usr/lib/${pkgname}/

  ln -s /usr/lib/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
