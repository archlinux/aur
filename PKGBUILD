# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-locale-git
pkgver=r320.84b55a8
pkgrel=1
pkgdesc='Switchboard Locale Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-locale'
license=('GPL3')
depends=('accountsservice' 'glib2' 'glibc' 'gnome-desktop' 'gtk3' 'ibus'
         'libgee' 'polkit'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-locale')
conflicts=('switchboard-plug-locale')
replaces=('switchboard-plug-locale-bzr')
source=('git+https://github.com/elementary/switchboard-plug-locale.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-locale

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-locale

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-locale/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-locale/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
