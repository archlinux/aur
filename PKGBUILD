# Maintainer: Saiem Saeed <saiem.saeed7 at gmail dot com>

pkgname=sayall
pkgver=0.1.3
pkgrel=1
pkgdesc='Wayland voice dictation daemon and recording HUD (prebuilt)'
arch=('x86_64')
url='https://github.com/saiemsaeed/sayall'
license=('MIT')
depends=(
  'ca-certificates'
  'gcc-libs'
  'glibc'
  'gtk4'
  'gtk4-layer-shell'
  'libnotify'
  'pipewire-audio'
  'wl-clipboard'
  'wtype'
)
provides=("sayall-bin=$pkgver")
conflicts=('sayall-bin' 'sayall-src' 'sayall-git')
replaces=('sayall-bin')
options=('!debug')
install='sayall.install'
source=("sayall-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/sayall-$pkgver-linux-x86_64.tar.gz")
sha256sums=('a5619ff3a694c7b6cb06309e511330fa561b324c764facea47556f83f8afd229')

package() {
  local src="$srcdir/sayall-$pkgver-linux-x86_64"

  install -Dm755 -t "$pkgdir/usr/bin" \
    "$src/bin/sayall" \
    "$src/bin/sayall-hud"

  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" \
    "$src/share/systemd/user/sayall.service" \
    "$src/share/systemd/user/sayall-hud.service"
  sed -i 's|%h/.local/bin/|/usr/bin/|g' \
    "$pkgdir/usr/lib/systemd/user/sayall.service" \
    "$pkgdir/usr/lib/systemd/user/sayall-hud.service"

  install -Dm644 -t "$pkgdir/usr/share/doc/sayall" \
    "$src/share/doc/sayall/README.md" \
    "$src/share/doc/sayall/CHANGELOG.md"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$src/share/licenses/sayall/"*
}
