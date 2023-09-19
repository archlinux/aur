# Maintainer: Brody <archfan at brodix dot de>

pkgname=cloud-sql-proxy
pkgver=2.7.0
pkgrel=1
pkgdesc='Cloud SQL Auth Proxy'
arch=(x86_64)
url=https://github.com/GoogleCloudPlatform/cloudsql-proxy
license=(Apache)
depends=(fuse3)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=(6880b54d19bc4348cf01c4a19e234b7c7cda42d7083103fbaafc7f9ed1a6a6db5e5ba857902f0b803216ca3f9da0a772f13f08c7d7ca41b918c1736c9a06edc0)

build() {
  cd ${pkgname}-${pkgver}
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode=external -extldflags \"${LDFLAGS}\" -X main.versionString=v${pkgver}" \
    -o out/${pkgname} \
    .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 out/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

# vim: ts=2 sw=2 et:
