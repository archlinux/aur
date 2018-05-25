# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=contractor-git
pkgver=r225.fe6f23e
pkgrel=1
pkgdesc=' A desktop-wide extension service'
arch=('x86_64')
url='https://github.com/elementary/contractor'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'libgee')
makedepends=('git' 'meson' 'vala')
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
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  arch-meson ../contractor
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
