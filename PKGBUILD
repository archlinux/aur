# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_beta=''
pkgname='s5cmd'
pkgver='2.0.0'
pkgrel='3'
pkgdesc='Parallel S3 and local filesystem execution tool.'
arch=('x86_64' 'i686')
url="https://github.com/peak/${pkgname}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}${_beta}.tar.gz")
sha256sums=('016554a753830477c203d3ec11ad37eefce43ca7817856f861a173158c8f4a88')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}${_beta}"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/peak"
  ln -snf "${srcdir}/${pkgname}-${pkgver}${_beta}" "${GOPATH}/src/github.com/peak/${pkgname}"
  cd ${GOPATH}
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/peak/${pkgname}"
  GOOS=linux go build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}${_beta}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
