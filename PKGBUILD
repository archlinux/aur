# Maintainer: Brody <archfan at brodix dot de>

pkgname=cloud-sql-proxy
pkgver=2.7.1
pkgrel=1
pkgdesc='Cloud SQL Auth Proxy'
arch=(x86_64)
url=https://github.com/GoogleCloudPlatform/cloudsql-proxy
license=(Apache)
depends=(fuse3)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=(7a8570cffb5e34876e08e27ed1d4e2d64fb8f226ec892541cb4d9a885d2c0ae0f4be4e19f7e2ece5616d82abdab0597739ab88274c8cfe3aaaa5f99e9c79abb3)

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
