# Maintainer: BrainDamage <braindamage springlobby.info>
# with liberal inspiration from codec2-svn PKGBUILD from Kyle Keen

pkgname=codec2
pkgver="0.6"
pkgrel=1
pkgdesc="an open source codec designed for communications quality speech below 5000 bit/s"
arch=("i686" "x86_64")
license=("LGPL")
url="http://rowetel.com/codec2.html"
depends=("glibc")
makedepends=("cmake")
source=("https://files.freedv.org/codec2/codec2-$pkgver.tar.xz")
sha1sums=("cec0be415d3292b692596f537aefe11cac4e780c")


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
