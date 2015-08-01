# Maintainer: David Runge <dave@sleepmap.de>
pkgname=ssr-git
_pkgname=ssr
pkgver=0.4.2.r37.g3c4138d
pkgrel=1
pkgdesc="The SoundScape Renderer (SSR) is a tool for real-time spatial audio reproduction providing a variety of rendering algorithms, e.g. Wave Field Synthesis, Higher-Order Ambisonics and binaural techniques."
arch=('i686' 'x86_64')
url="http://spatialaudio.net/ssr/"
conflicts=('ssr')
replaces=('ssr')
provides=('ssr')
license="GPL3"
depends=('jack' 'libsndfile' 'fftw' 'libxml2' 'ecasound' 'qt4')
makedepends=('git' 'boost-libs>=1.35' 'help2man')
source=("${_pkgname}-${pkgver}::git+https://github.com/SoundScapeRenderer/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}-${pkgver}/"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$srcdir/${_pkgname}-${pkgver}/"
  ./autogen.sh
  export QT_SELECT=4
  ./configure --prefix=/usr --disable-vrpn 2>&1 | tee configure.log
  make 2>&1 | tee make.log
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
}

