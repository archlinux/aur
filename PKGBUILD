# Maintainer: Jonathan Wright <jon@than.io>

pkgname=boundary-bin
pkgver=0.15.2
pkgrel=1
pkgdesc="Network resources access controller"
arch=('x86_64')
url="https://www.boundaryproject.io/"
license=('MPL2')
makedepends=('unzip')
provides=("boundary=${pkgver}")

source=("boundary-controller.service"
        "boundary-worker.service"
        "boundary.bash"
        "boundary.zsh"
        "boundary.fish")
source_x86_64=("boundary-${pkgver}.zip::https://releases.hashicorp.com/boundary/${pkgver}/boundary_${pkgver}_linux_amd64.zip")
sha256sums=('7fed68123ae0ef4571e22968824ea4f6a9adf1585ef6804bb1023190c1527a9b'
            '9803913afaee12c34addc93648d2a3c3ea736995f4979224de75def8ab36e2ed'
            'd4616a93ee3bb1a503d34ad49a36ead7d7a070efb9ee9eb2ccbdd59d70c17cf2'
            '64864d13c5cbe2fc29ea6cb8311d43d20abf3080fa3d7fc6c57dd5375954d8d6'
            '367519191efd5764f25d8e170d9eebc880802f563f8347fc2688d9386f950222')
sha256sums_x86_64=('8beb52476d266ce67ff5d4e7709e2705002d7c42d4a39e94dd8f546bcda2b33d')
options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/boundary" "$pkgdir/usr/bin/boundary"
  install -d "$pkgdir"/etc/boundary

  install -Dm644 boundary.fish "$pkgdir/usr/share/fish/completions/boundary.fish"
  install -Dm644 boundary.bash "$pkgdir/usr/share/bash-completion/completions/boundary"
  install -Dm644 boundary.zsh "$pkgdir/usr/share/zsh/site-functions/_boundary"

  install -Dm644 boundary-controller.service "$pkgdir/usr/lib/systemd/system/boundary-controller.service"
  install -Dm644 boundary-worker.service "$pkgdir/usr/lib/systemd/system/boundary-worker.service"
}
