#Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=evdev-keepalive
pkgver=v0.0.2.r0.ge45caf7
pkgrel=1
pkgdesc="Workaround for fauty 8BitDo and other controller firmwares."
arch=('x86_64')
url="https://github.com/pastaq/evdev-keepalive"
license=('MIT')
depends=()
makedepends=('git' 'clang')
source=("$pkgname::git+https://github.com/pastaq/evdev-keepalive")
sha256sums=('SKIP')
pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname}"
  clang ${srcdir}/${pkgname}/evdev_keepalive.c -o evdev_keepalive
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm644 ${srcdir}/${pkgname}/10-evdev-keepalive.rules "${pkgdir}"/usr/lib/udev/rules.d/10-evdev-keepalive.rules
  install -Dm644 ${srcdir}/${pkgname}/evdev-keepalive@.service "${pkgdir}"/usr/lib/systemd/system/evdev-keepalive@.service
  install -Dm755 ${srcdir}/${pkgname}/evdev_keepalive "${pkgdir}"/usr/bin/evdev_keepalive
}
