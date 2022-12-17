# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=textpieces
pkgver=3.4.0
pkgrel=1
pkgdesc="Transform text without using random websites"
arch=('x86_64' 'aarch64')
url="https://github.com/liferooter/textpieces"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'json-glib' 'libgee' 'python-pyaml')
makedepends=('blueprint-compiler' 'meson' 'vala')
checkdepends=('appstream-glib')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('00666274e11336f79913112152cee1dac34cc36051d160c818f0d43413a1e511ecf889c7213854c27c7a29c3a9026848b67e5a39221334f00e259cf33ed5b2c0')

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
