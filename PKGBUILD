# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
# Contributor: Romain Bazile <gromain.baz@gmail.com>
# Contributor: Bruno Rodriguez (brunorro)
# Contributor: Øyvind 'Mr.Elendig' Heggstad <mrelendig at har-ikkje dot net>
# Contributor: Travis Fickett <tfickett AT ufl DOT edu>
# Submitter: Anders Lund <anders at alweb dot dk>

pkgname=opencpn
pkgver=5.6.2
pkgrel=1
pkgdesc="Open Source Chart Plotting / Marine Navigation"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=('wxgtk3' 'portaudio' 'tinyxml' 'libsndfile' 'libarchive' 'libexif' 'glu' 'webkit2gtk')
optdepends=('gpsd: GPS position support')
makedepends=('cmake' 'lsb-release')
url="http://opencpn.org"
source=("https://github.com/OpenCPN/OpenCPN/archive/Release_${pkgver}.tar.gz" "wx_workaround.patch")
b2sums=('a45e19d293d63262f2bb6bd0bd5d18723cadd0b93af8e64484b55d246cebbe623dccbb6a1d257eccd74fb9111953d9cdd4b44d6f3fb38c3a9f40fa253718f337' 'dee0d7d6a62d13e35211f3e1e47beb30fa61755852435f53d8a540a1f3fd61fb57661890ec99fb258c11b152887858347d1f64e664f4401a252e62d563a0b68c')

prepare() {
  cd OpenCPN-Release_${pkgver}
  patch --strip=1 --input=../wx_workaround.patch
}

build() {
  cd OpenCPN-Release_${pkgver}
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd OpenCPN-Release_${pkgver}/build
  make DESTDIR="$pkgdir" install
}
