# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
# Contributor: Romain Bazile <gromain.baz@gmail.com>
# Contributor: Bruno Rodriguez (brunorro)
# Contributor: Øyvind 'Mr.Elendig' Heggstad <mrelendig at har-ikkje dot net>
# Contributor: Travis Fickett <tfickett AT ufl DOT edu>
# Submitter: Anders Lund <anders at alweb dot dk>

pkgname=opencpn
pkgver=5.10.2
pkgrel=1
pkgdesc="Open Source Chart Plotting / Marine Navigation"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=('wxwidgets-gtk3' 'portaudio' 'tinyxml' 'libsndfile' 'libarchive' 'libexif' 'glew' 'glu' 'webkit2gtk-4.1' 'wxsvg' 'rapidjson')
optdepends=('gpsd: GPS position support')
makedepends=('cmake' 'lsb-release')
url="http://opencpn.org"
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenCPN/OpenCPN/archive/Release_${pkgver}.tar.gz" "plugin.patch")
b2sums=('c1d97f6c49203db8aa66d917b41881d571f89fc8e9d986e346430613015a6870299df7050218645aa131f19a8494f341097f6bc1f6846a2e6e1ccc295bee979b' '947d087800afbad32bcaea0db6646880adf9ed874484379aa3cc97f7880e07695f917c207d98a91b152290aaddae79f823a04a010bb8fce9e924c014393b113f')

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
