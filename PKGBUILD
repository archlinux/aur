# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-files-git
pkgver=r5456.d791bddb
pkgrel=1
pkgdesc='The Pantheon File Manager'
arch=('i686' 'x86_64')
url='https://github.com/elementary/files'
license=('GPL3')
groups=('pantheon-unstable')
depends=('atk' 'cairo' 'dbus-glib' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2'
         'glibc' 'gtk3' 'libcanberra' 'libgee' 'libnotify' 'pango' 'plank'
         'sqlite' 'zeitgeist'
         'libgranite.so')
makedepends=('git' 'cmake' 'gnome-common' 'granite-git' 'vala')
optdepends=('contractor-git: Various context menu entries'
            'tumbler: Thumbnails generation')
provides=('pantheon-files')
conflicts=('pantheon-files')
install='pantheon-files.install'
source=('git+https://github.com/elementary/files')
sha256sums=('SKIP')

pkgver() {
  cd files

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/files"

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DCMAKE_SKIP_RPATH='TRUE' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd "$srcdir/files/build"

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
