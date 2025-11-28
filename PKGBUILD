pkgname=multi-gitter
pkgver=0.61.0
pkgdesc='Update multiple repositories in with one command'
pkgrel=1
arch=('x86_64')
url='https://github.com/lindell/multi-gitter'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lindell/multi-gitter/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('68f739fe26f982ab745740df049fdf6b3edb04ead6da3b2978861f6d7ef0ee173e3ad3b643da337908174b222f721ba33a5f306abcadcecb52f14e1f46338ad5')
license=('Apache-2.0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GO111MODULE="on"

  go build -o "${srcdir}/bin/multi-gitter"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/bin"
  install -Dm 755 'multi-gitter' "${pkgdir}/usr/bin/multi-gitter"
}
