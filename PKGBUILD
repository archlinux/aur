# Maintainer: BrainDamage
pkgname=sooperlooper-headless
_basename=sooperlooper
pkgver=1.7.8
pkgrel=1
pkgdesc="Live looping sampler capable of immediate loop recording (sans gui)"
arch=('x86_64' 'armv7h')
url="http://essej.net/sooperlooper/"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'libsigc++' 'alsa-lib' 'jack' 'liblo' 'libsamplerate' 'libsndfile' 'libxml2' 'ncurses' 'rubberband')
source=("${_basename}-${pkgver}.tar.gz::https://github.com/essej/${_basename}/archive/v${pkgver}.tar.gz")
sha256sums=('30df4b734a539fe8c49bf862ce8a7966e7b98012718414b6d13a1ec1faa9f788')
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
