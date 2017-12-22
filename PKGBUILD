# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-a11y-git
pkgver=r158.f7621ec
pkgrel=1
pkgdesc='Switchboard Universal Access Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-a11y'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-a11y')
conflicts=('switchboard-plug-a11y')
source=('git+https://github.com/elementary/switchboard-plug-a11y.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-a11y

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-a11y

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-a11y/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-a11y/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
