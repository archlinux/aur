# Maintainer: spider-mario <spidermario@free.fr>
pkgname=playgsf
pkgver=0.7.1
pkgrel=4
pkgdesc="Simple command line player for gsf files based on a winamp plugin"
arch=('i686' 'x86_64')
url="http://projects.raphnet.net/#playgsf"
license=('unknown')
groups=('multimedia')
depends=('libao' 'zlib')
makedepends=('libsndfile' 'libsamplerate')
source=(fixes.patch http://projects.raphnet.net/playgsf/$pkgname-$pkgver.tar.gz)
md5sums=('126f8c82b1af1dfe4195dc9a240dd251'
         'b68de49a511c3a9bfd051ebf3325b1ef')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../../fixes.patch

  # build libresample manually, building playgsf seems to fail randomly otherwise
  pushd libresample-0.1.3
    ./configure
    make
  popd

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin/"
  install playgsf "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
