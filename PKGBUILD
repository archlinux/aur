# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=backlight-dbus-git
pkgver=r6.71546b1
pkgrel=1
pkgdesc="a backlight controller using DBus"
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/maxerenberg/backlight-dbus"
license=('MIT')
depends=('systemd-libs')
source=('git+https://github.com/maxerenberg/backlight-dbus')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname//-git/}

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${pkgname//-git/}

  make
}

package() {
  cd ${pkgname//-git/}

  install -Dm755 "backlight-dbus" -t "$pkgdir/usr/bin"
  install -Dm644 "backlight-dbus.1" -t "$pkgdir/usr/share/man/man1"
}
