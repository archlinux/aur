# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=goda
pkgver=0.9.4
pkgrel=1
pkgdesc="Go Dependency Analysis toolkit"
arch=('x86_64')
url="https://github.com/loov/goda"
license=('MIT')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('5a3703666834905e65a8622eb7f9ae21432777f5bc16d646ec708d873983235c28b9a6b8d988b583f0742d756671f9eecb62e6489b3707991a7638a5ee565b39')

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
