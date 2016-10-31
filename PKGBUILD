# Maintainer:  <i@danmilon.me>
pkgname=notification-thing-git
pkgver=20161031
pkgver() {
  date +%Y%m%d
}
pkgrel=1
epoch=
pkgdesc="Python-based implementation of Desktop Notifications Specification (notification-daemon)"
arch=(any)
url="https://github.com/mk-fg/notification-thing"
license=('unknown')
groups=()
depends=('python2-dbus' 'python2-gobject')
makedepends=(git)
checkdepends=()
optdepends=(
  'python2-yaml: to configure daemon via YAML file, not CLI (--conf option).'
  'python2-pyzmq: to broadcast/receive notification messages over zeromq pub/sub sockets.'
  'libcanberra: to play sounds (from XDG themes or files).')
provides=('notification-thing')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git://github.com/mk-fg/notification-thing.git")
md5sums=('SKIP')
noextract=()

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  mkdir -p "$pkgdir/usr/share/dbus-1/services"
  install -m0644 org.freedesktop.Notifications.service "$pkgdir/usr/share/dbus-1/services/"
}

# vim:set ts=2 sw=2 et:
