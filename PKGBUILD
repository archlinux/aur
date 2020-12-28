# Maintainer:  Andy Mender <andymenderunix@gmail.com>
# Contributor: Andy Mender <andymenderunix@gmail.com>
pkgname=oaml
pkgver=1.3.4
pkgrel=1
pkgdesc="A library that makes it easy to implement adaptive music in games"
arch=('i686' 'x86_64')
url="https://oamldev.github.io/"
license=( 'MIT')
depends=('libogg' 'libsoxr' 'libvorbis' 'rtaudio')
makedepends=('cmake' 'boost')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oamldev/oaml/archive/v${pkgver}.tar.gz")
md5sums=('177ec311931ed7bf917654fb057dafa4')

build() {
  cd "${pkgname}-${pkgver}"
  # support for audio libraries listed in 'depends' is ON by default
  # we don't want static libraries
  # TODO: add support for Unity engine?
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_STATIC=OFF -DENABLE_UNITYPLUGIN=OFF
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" -C build install
}
