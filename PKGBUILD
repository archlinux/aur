# Maintainer:
# Contributor: Michał Szymański <smiszym at gmail dot com>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=traverso
pkgver=0.49.5
pkgrel=1
pkgdesc="Digital Audio Workstation with an innovative User Interface"
arch=('x86_64')
url="https://traverso-daw.org/"
license=('GPL')
depends=('qt5-base' 'jack' 'fftw' 'wavpack' 'lame' 'libmad' 'lilv' 'hicolor-icon-theme')
makedepends=('cmake')
source=("https://traverso-daw.org/$pkgname-$pkgver.tar.gz")
sha256sums=('75980d93e600d9cca0ee086819e2c8c07740631c4da096b78aec00e432d62d99')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
     -DCMAKE_INSTALL_PREFIX="/usr" \
     -DWANT_MP3_ENCODE=ON
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install

  cd ../$pkgname-$pkgver/resources
  install -Dm644 traverso.desktop "$pkgdir"/usr/share/applications/traverso.desktop

  install -d "$pkgdir"/usr/share/icons/hicolor
  cp -a freedesktop/icons/* "$pkgdir"/usr/share/icons/hicolor

  install -Dm644 x-traverso.xml "$pkgdir"/usr/share/mime/packages/x-traverso.xml
  install -Dm644 help.text "$pkgdir"/usr/share/doc/traverso/help.txt
}
