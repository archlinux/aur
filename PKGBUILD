# Maintainer: fenuks

_pkgname=arx-liberalis
pkgname=${_pkgname}-git
pkgver=r18896.20e8f2ac1
pkgrel=1
pkgdesc='Cross-platform port of Arx Fatalis, a first-person role-playing game'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/arx/ArxLibertatis"
license=('GPL3')
depends=('freetype2' 'openal' 'sdl2')
makedepends=('cmake' 'git' 'inkscape' 'boost' 'glm' 'optipng' 'imagemagick')
optdepends=(
'gdb: required by crash reporter'
'kdialog: for arx-install-data --gui'
'zenity: for arx-install-data --gui'
'xdialog: for arx-install-data --gui'
'innoextract: for copying data from cdrom or GOG.com setup file'
)
provides=(${_pkgname})
conflicts=(${_pkgname})
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/arx/ArxLibertatis")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build && cd build
  cmake -B. -H.. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBEXECDIR='bin'
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
