# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tofe <chris.chapuis@gmail.com>
# Contributor: erm67 <erm67@yahoo.it>

pkgname=cairo-dock-git
pkgver=3.4.1.r1.9e74374
pkgrel=1
pkgdesc='Light eye-candy fully themable animated dock'
arch=('i686' 'x86_64')
url='http://glx-dock.org/'
license=('GPL')
depends=('curl' 'dbus-glib' 'glu' 'gtk3' 'librsvg')
makedepends=('cmake' 'git')
optdepends=('cairo-dock-plugins-git: Plugins for Cairo-Dock')
provides=('cairo-dock')
conflicts=('cairo-dock')
source=("cairo-dock::git+https://github.com/Cairo-Dock/cairo-dock-core.git")
sha256sums=('SKIP')

pkgver() {
  cd cairo-dock

  tag='3.4.1'
  echo "${tag}.r$(git rev-list --count ${tag}..HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd cairo-dock

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd cairo-dock/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
