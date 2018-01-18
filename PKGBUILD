# Maintainer: Augustin deMayo <gus.demayo@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-code-git
pkgver=r2477.0a016808
pkgrel=1
pkgdesc='Code editor designed for elementary OS'
arch=('i686' 'x86_64')
url='https://github.com/elementary/code'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'glib2' 'glibc' 'gtk3' 'gtksourceview3' 'libgee' 'libpeas'
         'libsoup' 'pango' 'zeitgeist'
         'libgranite.so')
makedepends=('cmake' 'git' 'gobject-introspection' 'granite'
             'intltool' 'vala' 'vte3' 'webkit2gtk')
provides=('pantheon-code')
source=('pantheon-code::git+https://github.com/elementary/code.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-code
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd pantheon-code

  if [[ -d build ]]; then
    rm -rf build
  fi

  mkdir build
}

build() {
  cd pantheon-code/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd pantheon-code/build
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
