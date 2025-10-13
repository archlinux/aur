# Maintainer: Simon Hafner <hafnersimon@gmail.com>

pkgname='kwin-grayscale-timers'
pkgver=1.0
pkgrel=2
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
            'c877eb4622520f271b2debbc6b406d50926757b87759a4e3aeff85d8a98f6fcb'
            '35a2d2081cbcb2845254ae2d5725b3280be64a4f6ac2cb444f65d9c71843951e')

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
