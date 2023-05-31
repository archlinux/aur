# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: 0xMRTT <0xMRTT@proton.me>

pkgname=imaginer
_pkgname=Imaginer
pkgver=0.2.2
pkgrel=1
pkgdesc="Imagine with AI"
arch=('any')
url="https://imaginer.codeberg.page"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-lxml' 'python-openai' 'python-pillow'
         'python-requests' 'webkitgtk-6.0')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=(https://codeberg.org/Imaginer/Imaginer/archive/v${pkgver//_/-}.tar.gz)
b2sums=('81979b5503e3afccfa16e68d6eb5a327fb7d7590d764fad457b47d0a6688a5bd586b676e0b0ee4429caa8f45b76e105b42fd4d9b82db8d0a65d49d0723b3bef5')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  # fix binary permissions
  chmod 0755 "$pkgdir/usr/bin/$pkgname"
}
