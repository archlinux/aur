# Maintainer: David Runge <dave@sleepmap.de>
pkgname=ssr
pkgver=0.4.2
pkgrel=2
pkgdesc="The SoundScape Renderer (SSR) is a tool for real-time spatial audio reproduction providing a variety of rendering algorithms, e.g. Wave Field Synthesis, Higher-Order Ambisonics and binaural techniques."
arch=('i686' 'x86_64')
url="http://spatialaudio.net/ssr/"
conflicts=('ssr')
replaces=('ssr')
provides=('ssr')
license=('GPL3')
depends=('jack' 'libsndfile' 'fftw' 'libxml2' 'ecasound' 'qt4>=4.2.2')
makedepends=('git' 'boost-libs>=1.35' 'help2man')
source=("https://github.com/SoundScapeRenderer/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('d49b746a6959a0d3771fde4de686a044')


build() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  export QT_SELECT=4
  ./configure --prefix=/usr --disable-vrpn 2>&1 | tee configure.log
  make 2>&1 | tee make.log
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
}

