# Maintainer: 0xMRTT <0xMRTT@proton.me>

pkgname=imaginer
_pkgname=Imaginer
pkgver=0.1.5
pkgrel=2
pkgdesc="Imagine with AI"
arch=('any')
url="https://imaginer.codeberg.page"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-openai' 'python-pillow'
         'python-requests')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=(https://codeberg.org/Imaginer/Imaginer/archive/v${pkgver//_/-}.tar.gz)
b2sums=('1309dbeadf5e749334939e5f94246bc7efaf0b7babf1fc18a0df3fa6021d66a8950e1ee45d65c873d95ee0765da2b21902706debb78615450ceb845ce99e13e8')

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
