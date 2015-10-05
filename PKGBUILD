# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: MeMi69 <MetalMilitia@gmx.net>

pkgname=marsyas
pkgver=0.5.0
pkgrel=1
pkgdesc="Music Analysis, Retrieval and Synthesis for Audio Signals"
arch=('i686' 'x86_64')
license=('GPL')
url="http://marsyas.info"
depends=('jack2' 'alsa-lib' 'gcc-libs' 'libvorbis' 'libmad' 'lame')
optdepends=('qt5-declarative: for marsyas-inspector')
makedepends=('cmake' 'qt5-declarative' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marsyas/marsyas/archive/version-$pkgver.tar.gz")
md5sums=('2ef63105ddd9e6095a1e2d697acb49aa')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_RPATH=1 \
        -DWITH_MAD=1 \
        -DWITH_LAME=1 \
        -DWITH_VORBIS=1 \
        ../$pkgname-version-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install 
}
