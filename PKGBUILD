# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='s5cmd'
pkgver='2.0.0'
pkgrel='1'
pkgdesc='Parallel S3 and local filesystem execution tool.'
arch=('x86_64' 'i686')
url="https://github.com/peak/${pkgname}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}-beta.tar.gz")
sha256sums=('80281d27d0e2c864aefee83d0efff592398f56b761edae92637be80ded5ba55b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-beta"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/peak"
  ln -snf "${srcdir}/${pkgname}-${pkgver}-beta" "${GOPATH}/src/github.com/peak/${pkgname}"
  cd ${GOPATH}
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/peak/${pkgname}"
  GOOS=linux go build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-beta"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
