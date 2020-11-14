# Maintainer: BrainDamage
pkgname=sooperlooper-headless
_basename=sooperlooper
pkgver=1.7.4
pkgrel=1
pkgdesc="Live looping sampler capable of immediate loop recording (sans gui)"
arch=('x86_64' 'armv7h')
url="http://essej.net/sooperlooper/"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'libsigc++' 'alsa-lib' 'jack' 'liblo' 'libsamplerate' 'libsndfile' 'libxml2' 'ncurses' 'rubberband')
source=("${_basename}-${pkgver}.tar.gz::https://github.com/essej/${_basename}/archive/v${pkgver//./_}.tar.gz")
sha256sums=('69646705f48c3fe3c3371f3aba7052c67c5797bd3e2837e89cd998cb524cf23f')
provides=("${_basename}")
conflicts=("${_basename}")

prepare() {
  mv -v "${_basename}-${pkgver//./_}" "${_basename}-${pkgver}"
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
