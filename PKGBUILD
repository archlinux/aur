# Maintainer: Srevin Saju <srevinsaju at sugarlabs dot org>

pkgname=alloydb-auth-proxy
pkgver=1.6.2
pkgrel=1
pkgdesc='AlloyDB Auth Proxy'
arch=(x86_64)
url=https://github.com/GoogleCloudPlatform/alloydb-auth-proxy
license=(Apache)
depends=(fuse3)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=(93acbed293c6b5e91dd4c4b1a49ea7bc2f92b5b86d449a17f385243177c3194027cdc90f441a0a3fd42335bfa7ca18983f8edc8554b4419dcb1f99792bb18581)

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
