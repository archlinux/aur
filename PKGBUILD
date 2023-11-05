# Maintainer: Jonathan Wright <jon@than.io>

pkgname=boundary-bin
pkgver=0.14.2
pkgrel=1
pkgdesc="Network resources access controller"
arch=('x86_64')
url="https://www.boundaryproject.io/"
license=('MPL2')
makedepends=('unzip')
provides=("boundary=${pkgver}")

source=("boundary-controller.service"
        "boundary-worker.service")
source_x86_64=("boundary-${pkgver}.zip::https://releases.hashicorp.com/boundary/${pkgver}/boundary_${pkgver}_linux_amd64.zip")
sha256sums=('7fed68123ae0ef4571e22968824ea4f6a9adf1585ef6804bb1023190c1527a9b'
            '9803913afaee12c34addc93648d2a3c3ea736995f4979224de75def8ab36e2ed')
sha256sums_x86_64=('f9857707147490630137b8fa62f6086e235ec4d95815c4b8b56724537d8998ef')
options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/boundary" "$pkgdir/usr/bin/boundary"
  install -Dm644 boundary-controller.service "$pkgdir"/usr/lib/systemd/system/boundary-controller.service
  install -Dm644 boundary-worker.service "$pkgdir"/usr/lib/systemd/system/boundary-worker.service
  install -d "$pkgdir"/etc/boundary
}
