# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extensions-wifiqrcode
pkgver=1
_commit=2f9b2197f033ec50a7ffd242a495a3ec7b7be96a
pkgrel=1
pkgdesc="This extension add a switch to the WiFi menu, in the GNOME system menu, that show a QrCode of the active connection."
arch=('any')
url="https://gitlab.gnome.org/glerro/gnome-shell-extension-wifiqrcode"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson')
source=($pkgname::git+$url.git#commit=$_commit)
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
