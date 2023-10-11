# Maintainer: jgmdev <jgmdev@gmail.com>
# Contributor: FreeByrd <nelsonbyrd248@gmail.com>
# Contributor: Tofe <chris.chapuis@gmail.com>
# Contributor: erm67 <erm67@yahoo.it>

pkgname=cairo-dock-wayland-git
pkgver=3.4.99.r.bf8da4ef
pkgrel=1
pkgdesc='Light eye-candy fully themable animated dock with wayland support'
arch=('i686' 'x86_64')
url='http://glx-dock.org/'
license=('GPL')
depends=('curl' 'dbus-glib' 'glu' 'gtk3' 'librsvg' 'wayland')
makedepends=('cmake' 'git')
optdepends=(
  'wayfire-plugins-scale-ipc: Additional functionality on wayfire'
)
provides=('cairo-dock')
conflicts=('cairo-dock')
source=("cairo-dock::git+https://github.com/dkondor/cairo-dock-core.git#branch=wayland_new")
sha256sums=('SKIP')

pkgver() {
  cd cairo-dock

  tag='3.4.99'
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
