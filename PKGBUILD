# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=libssm
_pkgname=ssm
pkgver=1.4
pkgrel=5
pkgdesc="A C++ toolkit for superposition of macromolecules"
arch=('i686' 'x86_64')
url="https://launchpad.net/ssm"
license=('LGPL')
depends=('mmdb2>=2.0.19-1' 'libccp4>=6.5.1-6')
replaces=('ssmlib')
source=(https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/$_pkgname-$pkgver.tar.gz
	ssm.pc.in)
sha256sums=('56e7e64ed86d7d9ec59500fd34f26f881bdb9d541916d9a817c3bfb8cf0e9508'
            'fd8c44c92c60768744840959c0caa6ccf53018a54f3b31263b5afe672e1d4a30')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  cp $srcdir/ssm.pc.in ./ssm.pc.in
  aclocal
  libtoolize --automake --copy
  autoconf
  automake --copy --add-missing --gnu
  ./configure --prefix=/usr \
              --with-mmdb=/usr \
              --enable-ccp4 \
              --enable-shared \
              --disable-static
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
} 
