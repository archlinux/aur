# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>

pkgname=wallgen
pkgbase=${pkgname}
pkgver=0.1.1
pkgrel=1
_tag=v${pkgver}
pkgdesc='WallGen is a tool to generate wallpapers matching for your display configuration.'
arch=('any')
source=("git+https://github.com/hobbypunk90/WallGen.git#tag=${_tag}")
sha256sums=(SKIP)
license=('GPL')
depends=('python>=3.6' 'python-pydbus' 'python-gobject' 'imagemagick' 'python-wand')

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir/opt/WallGen"
  DESTBIN="$pkgdir/usr/bin"
  DESTSYSTEMD="$pkgdir/etc/systemd/user"
  mkdir -p "$DESTDIR"
  cp -r "WallGen/python" "$DESTDIR"
  install -Dm755 "WallGen/bin/wallgen" "$DESTDIR/bin/wallgen"
  install -Dm755 "WallGen/bin/wallgen" "$DESTBIN/wallgen"
  install -Dm644 "WallGen/systemd/wallgen.service" "$DESTSYSTEMD/wallgen.service"
  install -Dm644 "WallGen/systemd/wallgen.timer" "$DESTSYSTEMD/wallgen.timer"
  install -Dm644 "WallGen/systemd/wallgen-dbus.service" "$DESTSYSTEMD/wallgen-dbus.service"
  install -Dm644 "WallGen/systemd/wallgen-monitor.service" "$DESTSYSTEMD/wallgen-monitor.service"
}
