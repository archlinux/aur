# Maintainer: Brody <archfan at brodix dot de>

pkgname=cloud-sql-proxy
pkgver=2.14.2
pkgrel=1
pkgdesc='Cloud SQL Auth Proxy'
arch=(x86_64)
url=https://github.com/GoogleCloudPlatform/cloudsql-proxy
license=(Apache)
depends=(fuse3)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('16cb40beb0bbbd2abc8796ee75102a18a4fdbd4be74a2e566f857134ce9ae347dd92dcc608362f13f34a5211fb58f7fd18884086bf384b2f89f6dce02a151a8b')

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
