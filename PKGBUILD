# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-celestial-navigation
pkgver=2.4.40.0
pkgrel=1
pkgdesc="Implements nautical almanac for sun, moon, planets, and various navigational stars. Plugin for OpenCPN."
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/celestialnav.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/celestial_navigation_pi/archive/refs/tags/v${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/b22adb2031106fa60c0b3824b489eacd92930c79.tar.gz")
b2sums=('e97f5e8a27aedfce43a4bfd03f822e508f776b14d9efd5c4098a97ad70d4bc776e303f90e60f0c605c18ddfa43a2cf50a66861c2ac644b83645a19ffa4e7afc4' 'ae9cd331174b198f481c2c8365d4ffc1de9fa3629a669091c2dade7ef6767d32c5b0244c9526eef566c549ab4bfe9de09e266f97c959b3372c078f57fb742160')

prepare() {
  cp -r opencpn-libs-b22adb2031106fa60c0b3824b489eacd92930c79/* celestial_navigation_pi-${pkgver}/opencpn-libs
}

build() {
  cd celestial_navigation_pi-$pkgver
  mkdir -p build
  cd build
  BUILD_GTK3=TRUE cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPlugin_CXX11=ON  ..
  make
}

package() {
  cd celestial_navigation_pi-$pkgver/build
  DESTDIR="$pkgdir" make install
}
