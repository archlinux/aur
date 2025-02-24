# Maintainer: taotieren <admin@taotieren.com>

pkgname=linglong-pica
_tagname='1.2.4-1'
pkgver="${_tagname//-/_}"
# pkgver=1.2.4
pkgrel=0
pkgdesc='deb package to Linglong package tool.'
arch=($CARCH)
url='https://github.com/linuxdeepin/linglong-pica'
license=('LGPL-3.0-or-later')
provides=(
  ${pkgname}
)
conflicts=(
  ${pkgname}
)
replaces=()
depends=(
  sh
)
makedepends=(
  go
  pkgconf
)
# checkdepends=(
#   apt
# )
optdepends=("linyaps: Linglong is the container application toolkit ofdeepin.")
source=("${pkgname}-${_tagname}.tar.gz::${url}/archive/refs/tags/${_tagname}.tar.gz")
sha1sums=('7440c177ab608542fd0f079f9994c2f6230d5f82')

build() {
  cd "${srcdir}"/${pkgname}-${_tagname}/
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  export GO111MODULE=on
  export GOPROXY=https://goproxy.cn,direct
  make build

}

# check() {
#   cd "${srcdir}"/${pkgname}-${_tagname}/
#   make test
# }

package() {
  cd "${srcdir}"/${pkgname}-${_tagname}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
