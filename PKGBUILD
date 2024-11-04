# Maintainer: Brody <archfan at brodix dot de>

pkgname=cloud-sql-proxy
pkgver=2.14.0
pkgrel=1
pkgdesc='Cloud SQL Auth Proxy'
arch=(x86_64)
url=https://github.com/GoogleCloudPlatform/cloudsql-proxy
license=(Apache)
depends=(fuse3)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=(63b6e1d317019454f884c5775e73f1220ef601e286a9b112d6c2656c2ed3873390a441bca644e8cd8345f6be42bf056a1c9b0b9276d11af43c4b5eb4b81ba789)

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
