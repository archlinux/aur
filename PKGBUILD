# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=goda
pkgver=0.9.3
pkgrel=1
pkgdesc="Go Dependency Analysis toolkit"
arch=('x86_64')
url="https://github.com/loov/goda"
license=('MIT')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('d23f0e402df4b37c05e5c15d01aa6dcf59362e1e3948ab04368bfed5d4c8605f8b5c88f062387ff05c47f0ed6224ab45eb415f1f0c0f252085ca8213ab8e6188')

build() {
  cd "${srcdir}/${pkgname}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X main.Version=${pkgver} -linkmode external -extldflags \"${LDFLAGS}\"" \
    -o . ./...
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}/${pkgname}"
  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${srcdir}/${pkgname}/LICENSE"
}
