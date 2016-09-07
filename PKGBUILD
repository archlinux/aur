# Maintainer: Patrick Ziegler <p.ziegler96 at gmail dot com>
_pkgname="notification-mount"
pkgname="${_pkgname}-git"
pkgver=1.0.1
pkgrel=1
pkgdesc="Script to show notification for a block device with mount option"
arch=('any')
url="https://github.com/patrick96/$_pkgname"
license=('GPL3')
depends=('python' 'python-gobject' 'python-notify2' 'udevil')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m755 "./notification-mount" "$pkgdir/usr/bin/notification-mount"
  install -D -m644 ./examples/notification-mount.service \
    "$pkgdir/usr/lib/systemd/user/notification-mount.service"
}

# vim:set ts=2 sw=2 et:
