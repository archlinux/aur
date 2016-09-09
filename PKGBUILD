# Maintainer: Andrew Rabert <draje@nullsum.net>

_pkgname=Doom64EX
pkgname=doom64ex-git
pkgver=r128.8ee9313
pkgrel=1
pkgdesc="Doom64EX is a reverse-engineering project aimed to recreate Doom64 as close as possible with additional modding features."
arch=('i686' 'x86_64')
url="https://github.com/svkaiser/Doom64EX"
license=('GPL2')
depends=('fluidsynth' 'libpng' 'sdl2' 'sdl2_net' 'zlib')
makedepends=('cmake' 'git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir "${srcdir}/${_pkgname}/temp"
  cd "${srcdir}/${_pkgname}/temp"

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}/temp"

  make DESTDIR="$pkgdir" libdir="$pkgdir/usr/lib" install
}
