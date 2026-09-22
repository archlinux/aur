# Maintainer: sripwoud <me@sripwoud.xyz>
pkgname=tagwerk-git
pkgver=r59.f550f72
pkgrel=1
pkgdesc="Passive time tracker for Hyprland, nothing to start or stop"
arch=(any)
url="https://github.com/espadat-studio/tagwerk"
license=(AGPL-3.0-or-later)
depends=(python hyprland hypridle)
optdepends=('kitty: cwd stays exact with several tabs or splits open')
makedepends=(git)
provides=(tagwerk)
conflicts=(tagwerk)
install=tagwerk-git.install
source=("git+$url.git")
sha256sums=(SKIP)

pkgver() {
  cd tagwerk
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd tagwerk
  install -Dm755 tagwerk.py "$pkgdir/usr/bin/tagwerk"
  sed -i "s|^VERSION = \"master\"$|VERSION = \"$pkgver\"|" "$pkgdir/usr/bin/tagwerk"
  install -Dm644 contrib/tagwerk-focus.service contrib/tagwerk-idle.service -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 contrib/hypridle.conf contrib/claude-hooks.json -t "$pkgdir/usr/share/tagwerk"
  install -Dm644 contrib/pi/tagwerk.ts -t "$pkgdir/usr/share/tagwerk/pi"
}
