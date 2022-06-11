# Maintainer: talone <talone@boxph.one>
# co-Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=authenticator
_pkgname=Authenticator
pkgver=4.1.6
pkgrel=1
pkgdesc="2FA code generator for GNOME"
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=("GPL3")
depends=('libsecret' 'zbar' 'libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'pipewire')
makedepends=('meson' 'gobject-introspection' 'cargo' 'clang')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('8edc4d2f7de22827f6a1fe8bf53dee6961c56888655369fec426809ffb87a970443d5ec34bd8ed4108275ec78b5cb8daea1d54ec3bee4c19ceeb0163e69779d7')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
