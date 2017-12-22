# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=scratch-text-editor-git
pkgver=r2477.0a016808
pkgrel=1
pkgdesc='The Pantheon Text Editor'
arch=('x86_64')
url='https://github.com/elementary/scratch'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'glib2' 'glibc' 'gtk3' 'gtksourceview3' 'libgee' 'libpeas'
         'libsoup' 'pango' 'zeitgeist'
         'libgranite.so')
makedepends=('cmake' 'git' 'gobject-introspection' 'granite-git' 'gtkspell3'
             'intltool' 'vala' 'vte3' 'webkit2gtk')
optdepends=('gtkspell3: Spell Check extension'
            'vala: Outline extension'
            'vte3: Terminal extension'
            'webkit2gtk: Browser Preview extension')
provides=('scratch-text-editor')
conflicts=('scratch-text-editor')
replaces=('scratch-text-editor-bzr')
source=('scratch-text-editor::git+https://github.com/elementary/scratch.git')
sha256sums=('SKIP')

pkgver() {
  cd scratch-text-editor

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd scratch-text-editor

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd scratch-text-editor/build

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
