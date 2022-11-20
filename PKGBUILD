# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=hidpi-daemon
pkgver=18.04.6
pkgrel=3
pkgdesc="Daemon to manage HiDPI and LoDPI monitors on X"
arch=('any')
url="https://github.com/pop-os/hidpi-daemon"
license=('GPL2')
depends=('acpid' 'libnotify' 'python-gobject' 'python-pydbus' 'python-xlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ecb6135128c84dd37499c642d017ee663d7e91479806b8d67d1452fb1769c370')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build


  install -Dm755 "$pkgname" hidpi-notification prime-dialog -t "$pkgdir/usr/lib/$pkgname"
  install -Dm644 "$pkgname.desktop" hidpi-frontend.desktop -t "$pkgdir/etc/xdg/autostart"
  install -Dm644 com.system76.hidpi.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas"
  install -d "$pkgdir/var/lib/$pkgname"
}
