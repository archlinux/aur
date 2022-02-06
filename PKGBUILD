# Maintainer: chuvke <chuvke AT gmail DOT com>
pkgname=pygrid
pkgver=1.0.0.r15.g84648c6
_pkgrevision=84648c62e7ba6d49696df87e440888e387572d79
pkgrel=1
pkgdesc="Quickly place and move windows around the X11 desktop using a grid"
arch=('i686' 'x86_64')
url="https://github.com/pkkid/pygrid"
license=('GPL2')
depends=(python python-gobject python-xlib) 
makedepends=('git')
source=("${pkgname}::git+https://github.com/pkkid/${pkgname}.git#commit=${_pkgrevision}"
        "pygrid.desktop")
sha256sums=('SKIP'
            '5a2a96d93021253fd2f7fd3b3e048b429bdc3cfda926ad8d25e538312abd9f05')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm 644 "pygrid.desktop" "${pkgdir}/etc/xdg/autostart/pygrid.desktop"

  cd "$pkgname"
  install -Dm 755 "pygrid.py" "${pkgdir}/usr/bin/pygrid"
}
