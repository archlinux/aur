# Maintainer: 0xMRTT <0xMRTT@proton.me>

pkgname=imaginer
_pkgname=Imaginer
pkgver=0.2.0
pkgrel=2
pkgdesc="Imagine with AI"
arch=('any')
url="https://imaginer.codeberg.page"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-lxml' 'python-openai' 'python-pillow'
         'python-requests')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=(https://codeberg.org/Imaginer/Imaginer/archive/v${pkgver//_/-}.tar.gz)
b2sums=('b81a709585bdba2f48d01698021e184aa872ac13c104e20af5533030368556ce8c5a383c23a3db828a95f9a8da4f2a52faf81b782581480971e8598c14396f87')

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
