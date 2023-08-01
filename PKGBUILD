# Maintainer: BrainDamage
pkgname=sooperlooper-headless
_basename=sooperlooper
pkgver=1.7.9
pkgrel=1
pkgdesc="Live looping sampler capable of immediate loop recording (sans gui)"
arch=('x86_64' 'armv7h')
url="http://essej.net/sooperlooper/"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'libsigc++' 'alsa-lib' 'jack' 'liblo' 'libsamplerate' 'libsndfile' 'libxml2' 'ncurses' 'rubberband')
source=("${_basename}-${pkgver}.tar.gz::https://github.com/essej/${_basename}/archive/v${pkgver}.tar.gz")
sha256sums=('7d8f57a325bf2d1ead680c83f1d23e35a4ec748e81e7f962d02a7fa35f7da9f6')
provides=("${_basename}")
conflicts=("${_basename}")

prepare() {
  cd "${_basename}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${_basename}-${pkgver}"
  ./configure --prefix='/usr' --without-gui
  make
}

package() {
  cd "${_basename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
