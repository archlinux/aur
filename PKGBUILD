# Maintainer: David Runge <dave@sleepmap.de>
pkgname=ssr
pkgver=0.4.2
pkgrel=5
pkgdesc="A tool for real-time spatial audio reproduction providing a variety of rendering algorithms, e.g. Wave Field Synthesis, Higher-Order Ambisonics and binaural techniques."
arch=('i686' 'x86_64')
url="http://spatialaudio.net/ssr/"
conflicts=('ssr-git')
provides=('ssr')
license=('GPL3')
depends=('jack' 'libsndfile' 'fftw' 'libxml2' 'ecasound' 'qt4' 'boost-libs')
makedepends=('git' 'help2man')
source=("https://github.com/SoundScapeRenderer/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "ssr-qt4.patch")
sha512sums=('9e0364a499b5bd3526ff29575cbc2c0cf5b62d7915a0bd6c9df0c9cb54fa042c1052a2438dd8f2d903e61016ac8f0f6f0393aea01075574052b879f72b47d129'
            '030dd250e16e05872e7f97d893d81bfdd95ff8a90a8bc35ed1e69a644a92679602f17375e73529f260debfc5d3ae31e3b1d4976985c5e76bd9fd762a8af07551')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  patch -i "$srcdir/${pkgname}-qt4.patch"
  autoreconf -fi
}

build() {
  cd "${pkgname}-${pkgver}/"
  export QT_SELECT=4
  ./configure --prefix=/usr --disable-vrpn
  make
}

package() {
  cd "${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
}

