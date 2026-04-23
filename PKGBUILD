# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=kwybars-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Desktop audio visualizer for Wayland that renders real-time audio bars on screen"
arch=('x86_64')
url="https://github.com/naurissteins/Kwybars"
license=('MIT')
provides=('kwybars')
conflicts=('kwybars' 'kwybars-git')
options=('!debug')
depends=('gdk-pixbuf2' 'gtk4' 'gtk4-layer-shell' 'pipewire' 'cava')
optdepends=('libnotify: desktop error notifications via notify-send')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/naurissteins/Kwybars/releases/download/$pkgver/kwybars-$pkgver-x86_64-linux.tar.gz"
)
sha256sums=('052581bad50ba4153d33545fefcda032b2bae5fda7e27e9876f31510e906c7b3')

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
