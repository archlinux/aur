# Maintainer: BrainDamage <braindamage springlobby.info>
# with liberal inspiration from codec2-svn PKGBUILD from Kyle Keen

pkgname=codec2
pkgver=0.8
pkgrel=1
pkgdesc='an open source codec designed for communications quality speech below 5000 bit/s'
arch=('i686' 'x86_64')
license=('LGPL')
url='http://rowetel.com/codec2.html'
depends=('glibc' 'speex' 'libsamplerate')
makedepends=('cmake' 'subversion')
source=("$pkgname-$pkgver"'::svn+https://svn.code.sf.net/p/freetel/code/codec2/branches/'"$pkgver")
sha1sums=('SKIP')


build() {
  cd "$pkgname-$pkgver"
  mkdir -p build_dir
  cd build_dir
  cmake ../  -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR:PATH=lib
  make 
}

package() {
  cd "$pkgname-$pkgver"
  install -m644 -D COPYING "$pkgdir"/usr/share/licenses/codec2/COPYING
  install -m644 -D README "$pkgdir"/usr/share/doc/codec2/README
  install -m644 -D README_fdmdv.txt "$pkgdir"/usr/share/doc/codec2/README_fdmdv
  cd build_dir
  make DESTDIR="$pkgdir" install
}
