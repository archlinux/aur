# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=vdecapture-git
_pkgname=vdecapture
pkgver=r4.6cc3a88
pkgrel=1

pkgdesc="vdecapture captures packet data from a live VDE network and saves it to an output file in pcap format."
arch=('x86_64')
url='https://github.com/virtualsquare/vdecapture'
license=('GPL-2.0')
makedepends=('make' 'coreutils' 'cmake' 'vdeplug4')
depends=('vdeplug4')
provides=('vdecapture')
conflicts=('vdecapture')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  printf "r%s.%s" "$(git -C ${_pkgname} rev-list --count HEAD)" "$(git -C ${_pkgname} rev-parse --short=7 HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make -j $(nproc)
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir" install
}

