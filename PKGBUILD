# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=veila-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Secure, elegant, and fast Wayland screen locker"
arch=('x86_64')
url="https://github.com/naurissteins/Veila"
license=('GPL-3.0-or-later')
provides=('veila')
conflicts=('veila' 'veila-git')
options=('!debug')
depends=('libxkbcommon' 'pam')
optdepends=('systemd: enable the bundled user service with systemctl --user')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/naurissteins/Veila/releases/download/$pkgver/veila-$pkgver-x86_64-linux.tar.gz"
)
sha256sums=('1543f21d8d8660b05a5d3deb69909d86812f850cc8460f169d9d1e4035a998ed')

package() {
  cd "veila-$pkgver-x86_64-linux"

  install -Dm755 bin/veila "$pkgdir/usr/bin/veila"
  install -Dm755 bin/veilad "$pkgdir/usr/bin/veilad"
  install -Dm755 bin/veila-curtain "$pkgdir/usr/bin/veila-curtain"

  install -Dm644 share/veila/systemd/veilad.service \
    "$pkgdir/usr/lib/systemd/user/veilad.service"

  install -d "$pkgdir/usr/share/veila"
  cp -R share/veila/bg "$pkgdir/usr/share/veila/"
  cp -R share/veila/fonts "$pkgdir/usr/share/veila/"
  cp -R share/veila/icons "$pkgdir/usr/share/veila/"
  cp -R share/veila/systemd "$pkgdir/usr/share/veila/"
  cp -R share/veila/themes "$pkgdir/usr/share/veila/"

  install -Dm644 README.md "$pkgdir/usr/share/doc/veila/README.md"
}
