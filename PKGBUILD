# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=textpieces
pkgver=3.4.1
pkgrel=1
pkgdesc="Transform text without using random websites"
arch=('x86_64' 'aarch64')
url="https://github.com/liferooter/textpieces"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'json-glib' 'libgee' 'python-pyaml')
makedepends=('blueprint-compiler' 'meson' 'vala')
checkdepends=('appstream-glib')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('8bba17f548325e274f3d346c759b7350c359f80ec589147fa127656dc262df3e1b8a177f68980d1e117b80bd38ed3ac27b0cb669ae580b78c33a1c184b0ccb8c')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
