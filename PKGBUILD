# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extensions-wifiqrcode-git
pkgver=1.r0.g2f9b219
pkgrel=1
pkgdesc="This extension add a switch to the WiFi menu, in the GNOME system menu, that show a QrCode of the active connection."
arch=('any')
url="https://gitlab.gnome.org/glerro/gnome-shell-extension-wifiqrcode"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
