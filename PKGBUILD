# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=goda
pkgver=0.10.2
pkgrel=1
pkgdesc="Go Dependency Analysis toolkit"
arch=('x86_64')
url="https://github.com/loov/goda"
license=('MIT')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('4c47f28fcfc781164697cc62b85ca2f43ff81dfc96454e5ef97c916d04d44510ab64db89182af4c0ce5f0a30704928a7a04f3874049175ea7eb1717b6ec9d2c7')

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
