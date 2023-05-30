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
         'python-requests' 'webkitgtk-6.0')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=(https://codeberg.org/Imaginer/Imaginer/archive/v${pkgver//_/-}.tar.gz)
b2sums=('a4dad078a9629cdff07ca5450c80d46b4eca1460b25a13b1380f3c0c91ac689746cf05754453ecd54b9dbf49dafe71b07ff30001cfabe13243d99d632ec374e2')

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
