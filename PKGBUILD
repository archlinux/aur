# Maintainer:
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=galois
pkgver=0.6
pkgrel=1
pkgdesc='A falling blocks game with blocks of various shapes and sizes'
arch=('x86_64')
url="http://www.nongnu.org/galois"
license=('GPL3')
depends=('gtkmm3' 'libxml++')
source=("https://download.savannah.gnu.org/releases/galois/source/galois-$pkgver.tar.gz"
        "galois-0.6-install-path.patch"
        "galois-0.6-full-relro.patch"
        "galois-0.6-libxml++3.0.patch")

sha256sums=('de4743c9407afb33a186cd3a3cbf472d790901c41a009bd1775dcf59b466b346'
            'c4247271776f7b5df2b6bb92911c25a9ba3c30796171de5cd7dc1bd78e5a800d'
            '24c833ad3f898968938bf39768093f257e8badfb84058ada6c6f36df2e7c554d'
            '1bce72dfb66dcaa06e7c76c506c97595d9528914d6e4bd47beb8f2cfdaa97e3c')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../galois-0.6-install-path.patch
  patch -p1 -i ../galois-0.6-full-relro.patch
  patch -p1 -i ../galois-0.6-libxml++3.0.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
