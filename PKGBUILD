# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
# Contributor: Romain Bazile <gromain.baz@gmail.com>
# Contributor: Bruno Rodriguez (brunorro)
# Contributor: Øyvind 'Mr.Elendig' Heggstad <mrelendig at har-ikkje dot net>
# Contributor: Travis Fickett <tfickett AT ufl DOT edu>
# Submitter: Anders Lund <anders at alweb dot dk>

pkgname=opencpn
pkgver=5.8.4
pkgrel=1
pkgdesc="Open Source Chart Plotting / Marine Navigation"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=('wxgtk3' 'portaudio' 'tinyxml' 'libsndfile' 'libarchive' 'libexif' 'glew' 'glu' 'webkit2gtk' 'wxsvg')
optdepends=('gpsd: GPS position support')
makedepends=('cmake' 'lsb-release')
url="http://opencpn.org"
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenCPN/OpenCPN/archive/Release_${pkgver}.tar.gz" "plugin.patch")
b2sums=('0235d87daec97008b58dc9916d4250b33c0c4158be6ba4853bf30c5876af7d382eb1c02e2cd3748229775305cc90f86d5743b9951909043588e2096fcd207af5' '66a83b2ef79ce903884d1d072a5e4f8c6db557b2566fa1c50b82b4435cdbf787116c6b9f6d590e9240ca0c8bc06794ac5d9245e7ef18a2c03869f808c51582a6')

prepare() {
  cd OpenCPN-Release_${pkgver}
  patch --strip=1 --input=../plugin.patch
}

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
