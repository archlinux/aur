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
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
b2sums=('64457818288bd7fb0d5e993a9eed32f380754798521df37715903b3419bb789000a1839026a8677b8ef24dc5a11d7888a56398178f3ba428af3e8a6b55e8b686')
options=('!lto')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
