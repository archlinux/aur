# Maintainer:  graypawn <choi.pawn @gmail.com>

pkgname=yusuke
pkgver=1.7.8
pkgrel=1
pkgdesc="pacman update notifier"

arch=('i686' 'x86_64')
url="https://github.com/graypawn/yusuke"
license=('GPL3')

conflicts=('yusuke')
depends=('pacman' 'libnotify' 'python-gobject')
makedepends=('python-setuptools')
source=("https://github.com/graypawn/yusuke/archive/v$pkgver.zip")
md5sums=('7743ccb7378ea7e1eeac28ab86472485')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 yusuke-sync.service \
          "$pkgdir/etc/systemd/system/yusuke-sync.service"
  install -Dm644 yusuke-sync.timer \
          "$pkgdir/etc/systemd/system/yusuke-sync.timer"
  install -Dm644 yusuke-notify.service \
          "$pkgdir/usr/share/yusuke/yusuke-notify.service"
  install -Dm644 yusuke-notify.timer \
          "$pkgdir/usr/share/yusuke/yusuke-notify.timer"
}
