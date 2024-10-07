# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Michael Hauser-Raspe

pkgname=astro-cli
pkgver=1.29.0
pkgrel=1
pkgdesc="CLI that makes it easy to create, test and deploy Airflow DAGs to Astronomer "
arch=(x86_64)
url="https://github.com/astronomer/astro-cli"
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/astronomer/astro-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b9392eadc21d888b753e7c97c6f44da61ad0fcc90e9b2395e3fe39ee10cdcff5')

build() {
  cd "${pkgname}-${pkgver}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D astro-cli -t "${pkgdir}/usr/bin/"
}
