# Maintainer: BrainDamage <braindamage springlobby.info>
# with liberal inspiration from codec2-svn PKGBUILD from Kyle Keen

pkgname=codec2
pkgver="0.4"
pkgrel=1
pkgdesc="an open source codec designed for communications quality speech below 5000 bit/s"
arch=("i686" "x86_64")
license=("LGPL")
url="http://codec2.org/"
depends=("glibc")
makedepends=("subversion" "cmake")
source=("codec2::svn+https://freetel.svn.sourceforge.net/svnroot/freetel/codec2/tags/$pkgver")
md5sums=("SKIP")


build() {
  cd "codec2"
  mkdir -p build_dir
  cd build_dir
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR:PATH=lib
  make 
}

package() {
  cd "codec2"
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/codec2/COPYING"
  install -m644 -D README "$pkgdir/usr/share/doc/codec2/README"
  install -m644 -D README_fdmdv.txt "$pkgdir/usr/share/doc/codec2/README_fdmdv"
  cd "build_dir"
  make DESTDIR="$pkgdir" install
}
