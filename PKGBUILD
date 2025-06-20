# Maintainer: David Birks <david@birks.dev>
pkgname=ssmsh
pkgver=1.4.9
pkgrel=1
pkgdesc='Interactive shell for the AWS Parameter Store'
arch=('x86_64')
url='https://github.com/bwhaley/ssmsh'
license=('MIT')
makedepends=('go')
options=('!debug')
source=("ssmsh-${pkgver}.tar.gz::https://github.com/bwhaley/ssmsh/archive/v${pkgver}.tar.gz")
b2sums=('cd2d736960a98322c14a0b8d11d60f5234755fd5cc074dc75e66e7e4dd11470686707df25aa9be37b8bccc0fc2e7b78f48c860456b3c6fc5167f53c3ec9af3a9')

build() {
  cd "${srcdir}/ssmsh-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags="-X main.Version=${pkgver}" \
    -o ssmsh \
    ./ssmsh.go
}

package() {
  install -Dm755 "${srcdir}/ssmsh-${pkgver}/ssmsh" "${pkgdir}/usr/bin/ssmsh"
  install -Dm644 "${srcdir}/ssmsh-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
