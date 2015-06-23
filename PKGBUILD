# Maintainer: Moritz Lipp <mail@mlq.me>
pkgname=fmbt
_pkgname=fMBT
pkgver=0.23
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
  'imagemagick'
  'leptonica'
  'libedit'
  'libtool'
  'libxml2'
  'python-pyside-common'
  'python2'
  'python2-dbus'
  'python2-pexpect'
  'python2-pyside'
  'python2-shiboken'
  'tesseract'
  'tesseract-data-eng'
  )
source=(https://github.com/01org/$_pkgname/archive/v$pkgver.tar.gz
0001-Invalid-operands-to-binary-operator-in-findNextColor.patch)
md5sums=('c67e99833607a84e9c493a23526a797b'
         'e443161ac39c16af976758b2c946b589')

prepare() {
	cd "$_pkgname-$pkgver"
  patch -p1 < $srcdir/0001-Invalid-operands-to-binary-operator-in-findNextColor.patch
}

build() {
	cd "$_pkgname-$pkgver"
  ./autogen.sh
	./configure --prefix=/usr PYTHON=python2
	make
}

# check() {
# 	cd "$_pkgname-$pkgver"
# 	make -k check
# }

package() {
	cd "$_pkgname-$pkgver"
  export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
	make DESTDIR="$pkgdir/" install
}
