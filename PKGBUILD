# Maintainer: Moritz Lipp <mail@mlq.me>
pkgname=fmbt
pkgver=0.42
pkgrel=1
epoch=
pkgdesc="Free Model Based tool"
arch=('x86_64' 'i686')
url="https://01.org/fmbt/"
license=('GPL')
depends=(
  'boost'
  'flex'
  'gnuplot'
  'graphviz'
  'gts'
  'libmagick6'
  'leptonica'
  'libedit'
  'libtool'
  'libxml2'
  'python'
  'python-dbus'
  'python-pexpect'
  'tesseract'
  'tesseract-data-eng'
  )
source=(https://01.org/sites/default/files/downloads/${pkgname}-${pkgver}-1.tar.gz)
md5sums=('6c5c8cae4cc8bd15349dad6a06e7d12c')

prepare() {
  cd "$pkgname-$pkgver-1"
}

build() {
  cd "$pkgname-$pkgver-1"
  export PKG_CONFIG_PATH='/usr/lib/imagemagick6/pkgconfig'
  ./configure --prefix=/usr PYTHON=python2
  make
}

package() {
  cd "$pkgname-$pkgver-1"
  export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
  make DESTDIR="$pkgdir/" install
}
