# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-wifiqrcode
pkgver=14
_commit=485590a80961cfd19d40aedd2ca25201173760c7
pkgrel=1
pkgdesc="This extension add a switch to the WiFi menu, in the GNOME system menu, that show a QrCode of the active connection."
arch=('any')
url="https://gitlab.gnome.org/glerro/gnome-shell-extension-wifiqrcode"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson')
source=($pkgname::git+$url.git#commit=$_commit)
b2sums=('1bdb701a95a2972c9e09168f660f969887631beb90079f4ecd1d35bceb153a2719f0fb17dd858cd1f55fccf65ae22868ed4088b02f7ac6d76d27c601adab662d')

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
