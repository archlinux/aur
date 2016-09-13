# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=scratch-text-editor-bzr
pkgver=r1756
pkgrel=1
pkgdesc='The Pantheon Text Editor'
arch=('i686' 'x86_64')
url='https://launchpad.net/scratch'
license=('GPL3')
groups=('pantheon-unstable')
depends=('desktop-file-utils' 'glib2' 'glibc' 'gtk3' 'gtksourceview3' 'libgee'
         'libpeas' 'pango' 'zeitgeist'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'gobject-introspection' 'gtkspell3' 'intltool'
             'vala' 'vte3' 'webkit2gtk')
optdepends=('gtkspell3: Spell Check extension'
            'vala: Outline extension'
            'vte3: Terminal extension'
            'webkit2gtk: Browser Preview extension')
provides=('scratch-text-editor')
conflicts=('scratch-text-editor')
install='scratch-text-editor.install'
source=('scratch-text-editor::bzr+lp:scratch')
sha256sums=('SKIP')

pkgver() {
  cd scratch-text-editor

  echo "r$(bzr revno)"
}

prepare() {
  cd scratch-text-editor

  sed -i 's/gtkspell-3.0/gtkspell3-3.0/' plugins/spell/CMakeLists.txt
}

build() {
  cd scratch-text-editor

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
  cd scratch-text-editor/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
