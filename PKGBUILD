# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
pkgname=justbrowsing-systemd
pkgver=1.1
pkgrel=7
pkgdesc="SystemD Unit files and boot script to start JustBrowsing session"
arch=('any')
url="https://github.com/justbrowsing/justbrowsing-systemd"
license=('GPL3')
depends=('systemd' 'polkit')
optdepends=('jb-config: load/save and manage settings')
groups=("justbrowsing")
source=("https://github.com/justbrowsing/${pkgname}/archive/master.zip")
install="jb-systemd.install"
md5sums=('9e51b04d30ee1fafc24f38f54f12cac4')
 
package() {
  cd "$srcdir/${pkgname}-master"
  mkdir -p "$pkgdir/etc/polkit-1/rules.d"
  chmod 0700 "$pkgdir/etc/polkit-1/rules.d"

  # Boot script
  install -Dm755 restoreboot "$pkgdir/usr/bin/restoreboot"

  # Polkit rule
  install -Dm644 00-timezone.rules "$pkgdir/etc/polkit-1/rules.d/00-timezone.rules"

  # Unit files
  install -Dm644 autologin@.service "$pkgdir/usr/lib/systemd/system/autologin@.service"
  install -Dm644 restoreboot.service "$pkgdir/usr/lib/systemd/system/restoreboot.service"
  install -Dm644 savejb-daemon.service "$pkgdir/usr/lib/systemd/system/savejb-daemon.service"
}
