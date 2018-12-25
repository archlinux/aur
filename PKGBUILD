# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: dawn <crackofdusk at gmail ... com>
# Contributors: Profpatsch [https://bbs.archlinux.org/misc.php?email=68112]
#               ajs124
# Contributor: dos1

pkgname=performous-git
pkgver=1.0_888_g0bfa0324
pkgrel=1
pkgdesc='A free game like "Singstar", "Rockband" or "Stepmania" (version from git)'
arch=('i686' 'x86_64')
url="http://performous.org"
license=('GPL')
depends=('boost' 'ffmpeg' 'sdl2' 'cairo>=1.2' 'librsvg' 'glew' 'libxml++' 'portaudio' 'imagemagick')
optdepends=('portmidi: MIDI drum support' 'opencv: webcam support' 'ttf-ms-fonts: Microsoft core fonts')
makedepends=('cmake>=2.4' 'git' 'help2man' 'glm' 'cpprestsdk')
provides=(performous)
conflicts=(performous)
source=($pkgname::"git+https://github.com/performous/performous.git")
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe | sed -e 's|-|_|g'
}

prepare() {
  cd "${srcdir}/${pkgname}/ced"
  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir build -p
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}/" install
}
