# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=tutka
pkgver=1.1.3
pkgrel=3
pkgdesc="A free tracker style MIDI sequencer for GNU/Linux."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/tutka/"
license=('GPL')
depends=('qt5-base' 'alsa-lib' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=(http://download.savannah.gnu.org/releases/tutka/$pkgname-$pkgver.tar.xz qt5.patch)
md5sums=('f97f0cdb6cca471319695a8b268b9128' 'ea6a9a6e311be6c31e61a209123d6c77')

prepare() {
  cd $pkgname-$pkgver
  patch --forward --strip=1 --input="${srcdir}/qt5.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake INSTALL_DIR="$pkgdir"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
