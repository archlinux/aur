# Maintainer: Wayne Campbell <wcampbell1995 [at] gmail [dot] com>
pkgname=usb-notify-git
_pkgname=usb-notify
pkgver=v0.1.1.r0.gb4d0ffb
pkgrel=1
pkgdesc="Notification Daemon for usb events"
arch=('any')
url="https://github.com/userWayneCampbell/usb-notify"
license=('GPL')
depends=('libnotify')
source=("git+https://github.com/userWayneCampbell/usb-notify.git")
md5sums=('SKIP')

# Support without tags and with tags
pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "$srcdir/${_pkgname}"
    make && sudo make install
}
