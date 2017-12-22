# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-about-git
pkgver=r532.86ef551
pkgrel=1
pkgdesc='Switchboard About Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-about'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-about')
conflicts=('switchboard-plug-about')
replaces=('switchboard-plug-about-bzr')
source=('git+https://github.com/elementary/switchboard-plug-about.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-about

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-about

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-about/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-about/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
