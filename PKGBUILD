# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-datetime-git
pkgver=r236.df62aaa
pkgrel=1
pkgdesc='Switchboard Date & Time Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-datetime'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-datetime')
conflicts=('switchboard-plug-datetime')
replaces=('switchboard-plug-datetime-bzr')
source=('git+https://github.com/elementary/switchboard-plug-datetime.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-datetime

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-datetime

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-datetime/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-datetime/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
