# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=extension-manager
pkgver=0.3.2
pkgrel=2
pkgdesc="A native tool for browsing, installing, and managing GNOME Shell Extensions"
arch=('x86_64' 'aarch64')
url="https://github.com/mjakeman/extension-manager"
license=('GPL3')
depends=('libadwaita' 'libsoup3' 'json-glib' 'text-engine')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz
0329-add-dependencies-glib2.patch)
b2sums=('55d09b54219804c1910a572953d7fee4b8a9131085260db1d4ef014bccf8b13fa2da0a8673c0d78643841d603878183c2b573b084bcd5cb1818721e8194c871b'
        '817c88e5b9f14b4ae2d6b76010d23e13916bb4e9b3d686fa4f76dbf106548a666b50d7e3bb5bb02d54177cdcfa8765b9e8522838a60dd62da5bbae6499db7477')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i ../0329-add-dependencies-glib2.patch
}

build() {
  arch-meson "${pkgname%-git}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
