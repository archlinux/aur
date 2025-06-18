# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=nameinator
_pkgname=NAMEinator
pkgver=0.0.5
pkgrel=2
pkgdesc='Open-source DNS benchmark utility - successor of namebench'
arch=('x86_64')
url='https://github.com/mwiora/NAMEinator'
license=('Apache')
depends=('bind-tools')
makedepends=('go' 'git')
source=("https://github.com/mwiora/NAMEinator/archive/v${pkgver}/NAMEinator-${pkgver}.tar.gz")
b2sums=('78e6172f08a2be4dec3df0e3cc369b603d00340a6657403fd854f908d8f60e059b3775ce6802731527680e3e2c5817bbb7bb189307ddae34bea8dc092ed7ef6c')

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
