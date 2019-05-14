# Maintainer: Lieven Moors <lievenmoors at protonmail dot com>
# Contributor: Michał Szymański <smiszym at gmail dot com>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=traverso
pkgver=0.49.6
pkgrel=1
pkgdesc="Digital Audio Workstation with an innovative User Interface"
arch=('x86_64')
url="https://traverso-daw.org/"
license=('GPL')
depends=('qt5-base' 'fftw' 'wavpack' 'lame' 'libmad' 'lilv' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake')
source=("https://traverso-daw.org/$pkgname-$pkgver.tar.gz")
sha256sums=('f850b88cbb64529655514b7cfe01c56133e21929374b3e3b90813bc227eac789')

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
