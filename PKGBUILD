# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=eedi3
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R1.0.g54a567a
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (obsolete, but still used) (GIT version)"
arch=('x86_64')
url='https://github.com/vapoursynth/vs-eedi3-obsolete'
license=('GPL')
depends=('vapoursynth')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/vapoursynth/vs-eedi3-obsolete")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  echo "all:
	  gcc -c -fPIC ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o src/eedi3.o src/eedi3.c
	  gcc -fPIC ${CXXFLAGS} -shared -fPIC ${LDFLAGS} -o libvs${_plug}.so src/eedi3.o"> Makefile
}

build() {
  cd "${_plug}"
  make
}

package() {
  cd "${_plug}"
  install -Dm755 "libvs${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/libvs${_plug}.so"
}
