# Maintainer: İbrahim Hakkı Ergin <ibrahimh.ergin@gmail.com>
pkgname=xgestured-git
pkgver=r32.0375b5d
pkgrel=3
pkgdesc="A lightweight, minimal, and lightning-fast touchpad gesture daemon for X11"
arch=('x86_64')
url="https://github.com/06ergin06/xgestured"
license=('GPL3')
depends=('libinput')
makedepends=('git' 'gcc' 'make')
provides=('xgestured')
conflicts=('xgestured')
source=("git+${url}.git")
sha256sums=('SKIP')
install="xgestured.install"

pkgver() {
  cd "$srcdir/xgestured"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/xgestured"
  make
}

package() {
  cd "$srcdir/xgestured"
  sed -i 's|%h/.local/bin/xgestured|/usr/bin/xgestured|g' xgestured.service
  install -Dm755 xgestured "$pkgdir/usr/bin/xgestured"
  install -Dm644 xgestured.service "$pkgdir/usr/lib/systemd/user/xgestured.service"
  install -Dm644 config.ini "$pkgdir/etc/xgestured/config.ini"
}
