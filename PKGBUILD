# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Ben Poest <ben@poest.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=textpieces
pkgver=3.1.1
pkgrel=1
pkgdesc="Transform text without using random websites"
arch=('x86_64' 'aarch64')
url="https://github.com/liferooter/textpieces"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'python-pyaml' 'gtksourceview5' 'libgee')
makedepends=('blueprint-compiler' 'gobject-introspection' 'meson' 'vala')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('8c1372484d0a906b5f29caf9f36fd3a314b8d35e22f019a57fbe3d1a2924e07ee877b17d9f081a9fc993ae61a6f79825066736357af7edd8f329c645e2a26549')


build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
