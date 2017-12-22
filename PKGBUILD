# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-sound-git
pkgver=r76.15361b9
pkgrel=1
pkgdesc='Switchboard Sound Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-sound'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libcanberra' 'libgee' 'libpulse'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'gtk2' 'switchboard-git' 'vala')
provides=('switchboard-plug-sound')
conflicts=('switchboard-plug-sound')
source=('git+https://github.com/elementary/switchboard-plug-sound.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-sound

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-sound

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-sound/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-sound/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
