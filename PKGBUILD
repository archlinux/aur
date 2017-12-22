# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-printers-git
pkgver=r148.b074299
pkgrel=1
pkgdesc='Switchboard Printers Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-printers'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libcups' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-printers')
conflicts=('switchboard-plug-printers')
source=('git+https://github.com/elementary/switchboard-plug-printers.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-printers

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-printers

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-printers/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-printers/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
