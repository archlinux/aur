# Maintainer: Brody <archfan at brodix dot de>

pkgname=cloud-sql-proxy
pkgver=2.14.1
pkgrel=1
pkgdesc='Cloud SQL Auth Proxy'
arch=(x86_64)
url=https://github.com/GoogleCloudPlatform/cloudsql-proxy
license=(Apache)
depends=(fuse3)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('3a088f8ebced1612496b35ce5ebb6c9d9b0bd9d84acbed0d462935f310f58d19909753a73e6ed601902ff2028985533c5d9aad56106e349bd5d1f840f7285942')

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
