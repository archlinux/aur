# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=taptempo
pkgver=1.4.4
pkgrel=2
pkgdesc="A command line tap tempo. Hit enter key with style and you'll get the corresponding number of beats per minute (BPM). This tool is very useful to quickly find the tempo of a song without launching a big digital workstation like Ardour or LMMS"
arch=('x86_64')
url="https://taptempo.tuxfamily.org"
license=('GPL3')
depends=('gcc-libs')
makedepends=('catch2' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://download.tuxfamily.org/taptempo/${pkgver}/taptempo-${pkgver}.tar.gz")
sha256sums=('38d217779d07deec36aad725a31b91e60d6ec78d85b170f1d48a9bbe5ea57181')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  if [[ -d _build ]]; then
  	rm -rf _build
  fi
  mkdir _build
  cd _build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
}

build() {
  cd "$srcdir/$pkgname-$pkgver/_build"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/_build"
  DESTDIR=$pkgdir make install 
}