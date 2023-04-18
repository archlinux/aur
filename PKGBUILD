# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
# Contributor: Romain Bazile <gromain.baz@gmail.com>
# Contributor: Bruno Rodriguez (brunorro)
# Contributor: Øyvind 'Mr.Elendig' Heggstad <mrelendig at har-ikkje dot net>
# Contributor: Travis Fickett <tfickett AT ufl DOT edu>
# Submitter: Anders Lund <anders at alweb dot dk>

pkgname=opencpn
pkgver=5.8.0
pkgrel=1
pkgdesc="Open Source Chart Plotting / Marine Navigation"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=('wxgtk3' 'portaudio' 'tinyxml' 'libsndfile' 'libarchive' 'libexif' 'glew' 'glu' 'webkit2gtk' 'wxsvg')
optdepends=('gpsd: GPS position support')
makedepends=('cmake' 'lsb-release')
url="http://opencpn.org"
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenCPN/OpenCPN/archive/Release_${pkgver}.tar.gz")
b2sums=('7a85216526fc9d79995e2d0aabb55c68cd7627106e30e0a755df494cd30345131b7e8e8eb9d71f3c2c2cec0e15664a4ae45fa43f4332568b83b23f3839bf85ac')

build() {
  cd OpenCPN-Release_${pkgver}
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOCPN_BUILD_TEST=OFF -DOCPN_VERBOSE=OFF -DOCPN_USE_EXTERN_CURL=ON ..
  make
}

package() {
  cd OpenCPN-Release_${pkgver}/build
  make DESTDIR="$pkgdir" install
}
