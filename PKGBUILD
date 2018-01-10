# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gsignond-extension-pantheon-git
pkgver=r154.9218878
pkgrel=1
pkgdesc='Pantheon extension for the GSignond daemon'
arch=('x86_64')
url='https://github.com/elementary/gsignond-extension-pantheon'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'libsecret'
         'libgsignond-common.so')
makedepends=('cmake' 'git' 'gsignond-git' 'libaccounts-glib' 'libgsignon-glib'
             'vala')
provides=('gsignond-extension-pantheon')
conflicts=('gsignond-extension-pantheon')
replaces=('gsignond-extension-pantheon-bzr')
source=('git+https://github.com/elementary/gsignond-extension-pantheon.git')
sha256sums=('SKIP')

pkgver() {
  cd gsignond-extension-pantheon

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd gsignond-extension-pantheon

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd gsignond-extension-pantheon/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd gsignond-extension-pantheon/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
