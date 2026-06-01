# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=kwybars-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Desktop audio visualizer for Wayland that renders real-time audio bars on screen"
arch=('x86_64')
url="https://github.com/naurissteins/Kwybars"
license=('GPL-3.0-or-later')
provides=('kwybars')
conflicts=('kwybars' 'kwybars-git')
options=('!debug')
depends=('gdk-pixbuf2' 'gtk4' 'gtk4-layer-shell' 'pipewire' 'cava')
optdepends=('libnotify: desktop error notifications via notify-send')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/naurissteins/Kwybars/releases/download/$pkgver/kwybars-$pkgver-x86_64-linux.tar.gz"
)
sha256sums=('5dc61f572a16640758e90a3a7e93ab548e71b50f347ad41685db57784d7859b5')

package() {
  cd "kwybars-$pkgver-x86_64-linux"

  install -Dm755 kwybars-overlay "$pkgdir/usr/bin/kwybars-overlay"
  install -Dm755 kwybars-daemon "$pkgdir/usr/bin/kwybars-daemon"
  install -Dm755 kwybarsctl "$pkgdir/usr/bin/kwybarsctl"

  install -Dm644 kwybars-daemon.service \
    "$pkgdir/usr/lib/systemd/user/kwybars-daemon.service"

  install -d "$pkgdir/usr/share/kwybars/themes"
  install -m644 themes/*.toml "$pkgdir/usr/share/kwybars/themes/"
  if compgen -G "share/man/man1/*.1" > /dev/null; then
    install -Dm644 share/man/man1/*.1 -t "$pkgdir/usr/share/man/man1"
  fi
  install -Dm644 config.toml "$pkgdir/usr/share/doc/kwybars/examples/config.toml"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/kwybars/LICENSE"
}
