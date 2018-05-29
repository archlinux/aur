# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-code-git
pkgver=r3101.21d512a8
pkgrel=1
pkgdesc='The Pantheon Code Editor'
arch=('x86_64')
url='https://github.com/elementary/scratch'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'editorconfig-core-c' 'glib2' 'glibc' 'gtk3' 'gtksourceview3'
         'libgee' 'libpeas' 'libsoup' 'pango' 'zeitgeist'
         'libgranite.so')
makedepends=('appstream' 'git' 'gobject-introspection' 'granite-git'
             'gtkspell3' 'intltool' 'meson' 'vala' 'vte3' 'webkit2gtk')
optdepends=('gtkspell3: Spell Check extension'
            'vala: Outline extension'
            'vte3: Terminal extension'
            'webkit2gtk: Browser Preview extension')
provides=('pantheon-code' 'scratch-text-editor')
conflicts=('pantheon-code' 'scratch-text-editor')
replaces=('scratch-text-editor-git')
source=('pantheon-code::git+https://github.com/elementary/code.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-code

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  arch-meson ../pantheon-code
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
