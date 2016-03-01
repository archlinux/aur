# Maintainer: Tarn Burton <twburton at gmail dot com>
# Contributor: Dariusz 'quasi' Panchyrz <quasi@aur.archlinux.org>

pkgname=modglue
pkgver=1.19
pkgrel=2
pkgdesc="Modglue library for Cadabra computer algebra system (CAS)"
arch=('i686' 'x86_64')
url="http://cadabra.phi-sci.com/"
license=('GPL')
depends=('libsigc++')
install="$pkgname.install"
source=("http://cadabra.phi-sci.com/$pkgname-$pkgver.tar.gz" "package.patch")
md5sums=('0d3d764c93f8c1464852f78d8493476b'
         '5b1ce13c05e43f73f6ebe1589cbf5fc6')

prepare() {
 cd "$srcdir/$pkgname-$pkgver"
 patch -Np1 -i ../package.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr CXXFLAGS="-std=c++11"
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
