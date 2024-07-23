# Maintainer: Brody <archfan at brodix dot de>

pkgname=cloud-sql-proxy
pkgver=2.12.0
pkgrel=1
pkgdesc='Cloud SQL Auth Proxy'
arch=(x86_64)
url=https://github.com/GoogleCloudPlatform/cloudsql-proxy
license=(Apache)
depends=(fuse3)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=(9801aee1c15699c72fbb0887752d75a2bbb8b4aeb1e156c2292e8df39cdce02c691a2bf572caa8e1bdc94581bd77ee2b2711fd4a841f4c70bcf3b0bf512c7938)

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
