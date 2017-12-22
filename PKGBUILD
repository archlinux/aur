# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=contractor-git
pkgver=r214.ed0a014
pkgrel=1
pkgdesc=' A desktop-wide extension service'
arch=('x86_64')
url='https://github.com/elementary/contractor'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'libgee')
makedepends=('cmake' 'git' 'vala')
provides=('contractor')
conflicts=('contractor')
replaces=('contractor-bzr')
source=('git+https://github.com/elementary/contractor.git')
sha256sums=('SKIP')

pkgver() {
  cd contractor

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd contractor

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd contractor/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd contractor/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
