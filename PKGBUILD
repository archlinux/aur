# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-sharing-git
pkgver=r146.4282cd2
pkgrel=1
pkgdesc='Switchboard Sharing Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-sharing'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-sharing')
conflicts=('switchboard-plug-sharing')
source=('git+https://github.com/elementary/switchboard-plug-sharing.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-sharing

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-sharing

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-sharing/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-sharing/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
