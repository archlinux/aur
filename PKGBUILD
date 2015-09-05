# Maintainer: BrainDamage <braindamage springlobby.info>
# with liberal inspiration from codec2-svn PKGBUILD from Kyle Keen

pkgname=codec2
pkgver="0.4"
pkgrel=2
pkgdesc="an open source codec designed for communications quality speech below 5000 bit/s"
arch=("i686" "x86_64")
license=("LGPL")
url="http://codec2.org/"
depends=("glibc")
makedepends=("cmake")
source=("https://files.freedv.org/codec2/codec2-$pkgver.tar.gz")
sha1sums=("783af547827c62ae491976958ddf44f5d1555481")


build() {
  cd "codec2-$pkgver"
  mkdir -p build_dir
  cd build_dir
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR:PATH=lib
  make 
}

package() {
  cd "codec2-$pkgver"
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/codec2/COPYING"
  install -m644 -D README "$pkgdir/usr/share/doc/codec2/README"
  install -m644 -D README_fdmdv.txt "$pkgdir/usr/share/doc/codec2/README_fdmdv"
  cd "build_dir"
  make DESTDIR="$pkgdir" install
}
