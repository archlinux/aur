# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
# Contributor: Romain Bazile <gromain.baz@gmail.com>
# Contributor: Bruno Rodriguez (brunorro)
# Contributor: Øyvind 'Mr.Elendig' Heggstad <mrelendig at har-ikkje dot net>
# Contributor: Travis Fickett <tfickett AT ufl DOT edu>
# Submitter: Anders Lund <anders at alweb dot dk>

pkgname=opencpn
pkgver=5.10.2
pkgrel=3
pkgdesc="Open Source Chart Plotting / Marine Navigation"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=('wxwidgets-gtk3' 'portaudio' 'tinyxml' 'libsndfile' 'libarchive' 'libexif' 'glew' 'glu' 'webkit2gtk-4.1' 'wxsvg' 'rapidjson')
optdepends=('gpsd: GPS position support')
makedepends=('cmake' 'lsb-release')
url="http://opencpn.org"
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenCPN/OpenCPN/archive/Release_${pkgver}.tar.gz" "plugin.patch" "shapelib.patch")
b2sums=('c1d97f6c49203db8aa66d917b41881d571f89fc8e9d986e346430613015a6870299df7050218645aa131f19a8494f341097f6bc1f6846a2e6e1ccc295bee979b' '9568efe6d810eb3ad4305d45855519b610b6262b2e764af68bb9c657f4e7b0fb8e2ca0d45ad446cc76f5ebefd609b83a15da805176be0b1d06b2c780c9f42c93' '1acb94059d480b0342d154189cfbd5852004e3e16ff93e12376fae416ddd29eecd243d4618aedd29f519edf43e0e93655024190ee436fe9aa898d0fde0c2f88b')

prepare() {
  cd OpenCPN-Release_${pkgver}
  patch --strip=1 --input=../plugin.patch
  patch --strip=1 --input=../shapelib.patch
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
