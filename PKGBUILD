pkgname=things-cloud-tools-bin
pkgver=0.1.0
pkgrel=2
pkgdesc='CLI and background sync tools for Things Cloud'
arch=('x86_64')
url='https://github.com/szcharlesji/things-cloud-sdk'
license=('MIT')
depends=('bash' 'systemd')
install='things-cloud-tools-bin.install'
source=(
  "https://github.com/szcharlesji/things-cloud-sdk/releases/download/v0.1.0/things-cloud-tools_0.1.0_linux_amd64.tar.gz"
  "things-cloud-tools-bin.install"
)
sha256sums=(
  '49634ccc09a7209a093ac9ee97cfac0f8782b4804445627947b0df603d42ecf3'
  'SKIP'
)

package() {
  cd "$srcdir/things-cloud-tools_0.1.0_linux_amd64"

  install -Dm755 bin/things-cli "$pkgdir/usr/bin/things-cli"
  install -Dm755 bin/thingsync "$pkgdir/usr/bin/thingsync"
  install -Dm755 bin/things-setup "$pkgdir/usr/bin/things-setup"

  install -Dm644 systemd/thingsync.service     "$pkgdir/usr/lib/systemd/user/thingsync.service"
  install -Dm644 systemd/thingsync.timer     "$pkgdir/usr/lib/systemd/user/thingsync.timer"

  install -Dm644 doc/env.example     "$pkgdir/usr/share/doc/things-cloud-tools-bin/env.example"
  install -Dm644 LICENSE     "$pkgdir/usr/share/licenses/things-cloud-tools-bin/LICENSE"
}
