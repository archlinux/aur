# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=stunner
pkgver=0.0.12
pkgrel=1
pkgdesc="Detect your NAT quickly and easily"
arch=('x86_64')
url="https://github.com/jaxxstorm/stunner"
license=('MIT')
depends=()
makedepends=('git' 'go')
options=()
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
b2sums=('44ac5c0dd9bf4e7d0e759c2b54cc8d78ae33afe5e2ef584a15ba95391cfb871b114f46ab737213603750c60194b7d81f48ba3ca675c42d611a6aff775f751295')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X main.Version=${pkgver} -linkmode external -extldflags \"${LDFLAGS}\"" \
    -o . ./...
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${srcdir}/${pkgname}-${pkgver}/LICENSE"
}
