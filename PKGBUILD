# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=kwybars-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Desktop audio visualizer for Wayland that renders real-time audio bars on screen"
arch=('x86_64')
url="https://github.com/naurissteins/Kwybars"
license=('MIT')
provides=('kwybars')
conflicts=('kwybars' 'kwybars-git')
options=('!debug')
depends=('gtk4' 'gtk4-layer-shell' 'pipewire' 'cava')
optdepends=('libnotify: desktop error notifications via notify-send')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/naurissteins/Kwybars/releases/download/$pkgver/kwybars-$pkgver-x86_64-linux.tar.gz"
)
sha256sums=('cbf21e4827c42baffaa72c95190e9d28be8f5cd68c876ec1ee9ffb6e8a24bada')

package() {
  cd "kwybars-$pkgver-x86_64-linux"

  install -Dm755 kwybars-overlay "$pkgdir/usr/bin/kwybars-overlay"
  install -Dm755 kwybars-daemon "$pkgdir/usr/bin/kwybars-daemon"
  install -Dm755 kwybarsctl "$pkgdir/usr/bin/kwybarsctl"

  install -Dm644 kwybars-daemon.service \
    "$pkgdir/usr/lib/systemd/user/kwybars-daemon.service"

  install -d "$pkgdir/usr/share/kwybars/themes"
  install -m644 themes/*.toml "$pkgdir/usr/share/kwybars/themes/"
  install -Dm644 config.toml "$pkgdir/usr/share/doc/kwybars/examples/config.toml"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/kwybars/LICENSE"
}
