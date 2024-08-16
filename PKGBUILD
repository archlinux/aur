# Maintainer: Brody <archfan at brodix dot de>

pkgname=cloud-sql-proxy
pkgver=2.13.0
pkgrel=1
pkgdesc='Cloud SQL Auth Proxy'
arch=(x86_64)
url=https://github.com/GoogleCloudPlatform/cloudsql-proxy
license=(Apache)
depends=(fuse3)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=(2e47b90005b740c7845b302e8a361c4174bf2165be1879dd5f89f8295109181c6c60ab39b5f88ca6fafb10b3ca91dd05f8b9406708eb39564053cb7540c3934c)

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
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname} LICENSE
  install -Dm755 -t "${pkgdir}"/usr/bin out/${pkgname}
}

# vim: ts=2 sw=2 et:
