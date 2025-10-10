# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=goda
pkgver=0.7.1
pkgrel=1
pkgdesc="Go Dependency Analysis toolkit"
arch=('x86_64')
url="https://github.com/loov/goda"
license=('MIT')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
b2sums=('44b28610c5e07a8bd86b874abd84d0f0fc210193bd5464df36a77003ef650ca61e256fc24e78a1c1e021edc76f4ea38f571833d312b2f4cb43d7163922345f5c')

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
