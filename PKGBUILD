# Maintainer: Simon Hafner <hafnersimon@gmail.com>

pkgname='kwin-grayscale-timers'
pkgver=1.1
pkgrel=1
pkgdesc="Systemd user timers to toggle Grayscale timers on a schedule"
depends=('kwin6-grayscale-effect')
arch=('any')
url="https://github.com/reactormonk/kwin-grayscale-effect"
license=('GPL3')
install=${pkgname}.install

source=(
  "enable-grayscale@.service"
  "disable-grayscale@.service"
  "enable-grayscale@.timer"
  "disable-grayscale@.timer"
)
sha256sums=('28eddf5cfc6f50a4b07613805c07c2d08496ab55d8d642e2fc68388ba2f103ff'
            'bc0e49ce24aed79d64c6dbe03fd2f3d5de97148066f67adbba1f0aeed75395a1'
            'dd2939c62e4b54808364e0f01d32036f34cca7a89f97dcd78558bfcfb16de594'
            '084676eee75f7aa1d131dfa01351e00c128f78dce3cf9ffb13787aa9a5f8df46')

# Optional: qdbus client location varies (qt5-tools provides 'qdbus'; qt6-tools provides 'qdbus6')
optdepends=('qt5-tools: qdbus client' 'qt6-tools: qdbus6 client')

package() {
  local unitdir="$pkgdir/usr/lib/systemd/user"
  install -d "$unitdir"

  install -Dm644 "$srcdir/enable-grayscale@.service" "$unitdir/enable-grayscale@.service"
  install -Dm644 "$srcdir/disable-grayscale@.service" "$unitdir/disable-grayscale@.service"
  install -Dm644 "$srcdir/enable-grayscale@.timer"   "$unitdir/enable-grayscale@.timer"
  install -Dm644 "$srcdir/disable-grayscale@.timer"  "$unitdir/disable-grayscale@.timer"
}
