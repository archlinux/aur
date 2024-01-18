# Maintainer: Brody <archfan at brodix dot de>

pkgname=cloud-sql-proxy
pkgver=2.8.2
pkgrel=1
pkgdesc='Cloud SQL Auth Proxy'
arch=(x86_64)
url=https://github.com/GoogleCloudPlatform/cloudsql-proxy
license=(Apache)
depends=(fuse3)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=(63ef143feb3822a1b68a731c3b46c48a34a30437155df77087a689a6f2df2644223a28c2b227aa8a6a26d306050d253bf35d5af8aee3df9cb5ca52ca871d02c3)

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
