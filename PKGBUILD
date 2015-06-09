# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=scratch-text-editor
pkgver=2.1.0
pkgrel=1
pkgdesc='The Pantheon Text Editor'
arch=('i686' 'x86_64')
url='https://launchpad.net/scratch'
license=('GPL3')
groups=('pantheon')
depends=('desktop-file-utils' 'granite-bzr' 'gtksourceview3' 'libpeas' 'zeitgeist')
makedepends=('cmake' 'gobject-introspection' 'vala' 'vte3' 'webkitgtk')
optdepends=('vala: Outline extension'
            'vte3: Terminal extension'
            'webkitgtk: Browser Preview extension')
install='scratch-text-editor.install'
source=("https://launchpad.net/scratch/${pkgver%%.*}.x/${pkgver%.*}/+download/scratch-${pkgver}.tgz")
sha256sums=('daaaffbf1d990dd9359da27a594a29761100ffb12dd60b275f099f10646f225e')

prepare() {
  cd scratch-${pkgver}

  sed -i 's/gtkspell-3.0/gtkspell3-3.0/' plugins/spell/CMakeLists.txt
}

build() {
  cd scratch-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd scratch-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
