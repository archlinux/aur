# Maintainer: Tarn Burton <twburton at gmail dot com>
# Contributor: Dariusz 'quasi' Panchyrz <quasi@aur.archlinux.org>

pkgname=cadabra
pkgver=1.33
pkgrel=6
pkgdesc="A computer algebra system designed specifically for the solution of problems encountered in field theory."
arch=('i686' 'x86_64')
url="http://cadabra.phi-sci.com/"
license=('GPL')
depends=('conlie' 'modglue' 'gmp' 'pcre' 'gtkmm' 'texlive-core') # for gui: 'gtkmm' 'dvipng' 'texlive' 'breqn' http://www.ctan.org/pkg/breqn
install="$pkgname.install"
source=("http://cadabra.phi-sci.com/$pkgname-$pkgver.tar.gz" "package.patch")
md5sums=('cee8ae23c169958aba09b64e4ea479ce'
         '3346f2dcc00c4879417329e8bdfe350d')

prepare() {
 cd "$srcdir/$pkgname-$pkgver"
 patch -Np1 -i ../package.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver/
  ./configure --prefix=/usr CXXFLAGS="-std=c++11" #--enable-gui
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make DESTDIR="${pkgdir}" install
}
