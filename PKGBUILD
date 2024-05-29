# Maintainer: Brody <archfan at brodix dot de>

pkgname=cloud-sql-proxy
pkgver=2.11.3
pkgrel=1
pkgdesc='Cloud SQL Auth Proxy'
arch=(x86_64)
url=https://github.com/GoogleCloudPlatform/cloudsql-proxy
license=(Apache)
depends=(fuse3)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=(7eb1833ee223eaf3dbb7dc715e0ace9445ae8aedbf2c777cf9eb74c4378b7f59d5527ca566d15c8f6088385dc0f0c12c79e364ebaef13636c0cd918283b7886a)

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
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm755 out/${pkgname} -t "${pkgdir}"/usr/bin
}

# vim: ts=2 sw=2 et:
