# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=veila-bin
pkgver=0.3.0
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
sha256sums=('1182a93c58d4a1ab2036100ec4a3aa08baf73cc52b8bf00fce0782bf1106314d')

package() {
  cd "veila-$pkgver-x86_64-linux"

  install -Dm755 bin/veila "$pkgdir/usr/bin/veila"
  install -Dm755 bin/veilad "$pkgdir/usr/bin/veilad"
  install -Dm755 bin/veila-curtain "$pkgdir/usr/bin/veila-curtain"

  install -Dm644 share/veila/systemd/veilad.service \
    "$pkgdir/usr/lib/systemd/user/veilad.service"

  install -d "$pkgdir/usr/share/veila"
  cp -R share/veila/fonts "$pkgdir/usr/share/veila/"
  cp -R share/veila/icons "$pkgdir/usr/share/veila/"
  cp -R share/veila/systemd "$pkgdir/usr/share/veila/"
  cp -R share/veila/themes "$pkgdir/usr/share/veila/"

  install -Dm644 README.md "$pkgdir/usr/share/doc/veila/README.md"
}
