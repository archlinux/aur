# Maintainer: Jonathan Wright <jon@than.io>

pkgname=boundary-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="Network resources access controller"
arch=('x86_64')
url="https://www.boundaryproject.io/"
license=('MPL2')
makedepends=('unzip')
provides=("boundary=${pkgver}")

source=("boundary-controller.service"
        "boundary-worker.service")
source_x86_64=("boundary-${pkgver}.zip::https://releases.hashicorp.com/boundary/${pkgver}/boundary_${pkgver}_linux_amd64.zip")
sha256sums=('f19a46ef6b27a8d876c41754f7f3025cf82c9e99acb1943c8823ebc45dd43922'
            '8806113bc4d6c420a236c727b41d491a3328bff65e64a78b7f14192103ef69d5')
sha256sums_x86_64=('75eea11381848cf8583932b8bed948801471a2230d256ed3ebd1c63999e1903d')
options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/boundary" "$pkgdir/usr/bin/boundary"
  install -Dm644 boundary-controller.service "$pkgdir"/usr/lib/systemd/system/boundary-controller.service
  install -Dm644 boundary-worker.service "$pkgdir"/usr/lib/systemd/system/boundary-worker.service
  install -d "$pkgdir"/etc/boundary
}
