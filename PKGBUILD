# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-screenshot-git
pkgver=r420.6bdfcd1
pkgrel=1
pkgdesc='The Pantheon Screenshot Tool'
arch=('i686' 'x86_64')
url='https://github.com/elementary/screenshot-tool'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libcanberra'
         'libgranite.so')
makedepends=('cmake' 'git' 'granite-git' 'intltool' 'vala')
provides=('pantheon-screenshot')
conflicts=('pantheon-screenshot')
source=("pantheon-screenshot::git+https://github.com/elementary/screenshot-tool.git")
sha256sums=('SKIP')

pkgver() {
  cd pantheon-screenshot

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd pantheon-screenshot

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-screenshot/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='OFF' \
    -DICON_UPDATE='OFF'
  make
}

package() {
  cd pantheon-screenshot/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
