# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=hypatia
pkgver=0.1.1
pkgrel=1
pkgdesc="A research helper tool that provides context and information about interesting topics."
arch=('x86_64' 'aarch64')
url="https://github.com/HypatiaProject/hypatia"
license=('GPL3')
depends=('libadwaita' 'libgee' 'libsoup3' 'json-glib')
makedepends=('meson' 'gobject-introspection' 'vala')
checkdepends=('appstream-glib')
source=($url/archive/$pkgver.tar.gz)
b2sums=('4cc26adb7786f59b69dcc6c75763c35e663e26a9f9dedd96d25f643c548cf468f2d829d41da89edb4c3055d93b4b337f0d0ca8076a168582601b6309198f4bb4')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
