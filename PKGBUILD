# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: George Sofianos <https://github.com/geocool>

pkgname=eradio-git
pkgver=115.7f6453f
pkgrel=1
_gitname=eRadio
pkgdesc='A minimalist and powerfull radio player for elementary OS.'
arch=('i686' 'x86_64')
url='https://github.com/DreamDevel/eRadio'
license=('GPL3')
depends=('granite-bzr' 'gtk3' 'gstreamer0.10' 'sqlite' 'libgee' 'libnotify' 'json-glib' 'libsoup' 'libxml2' 'sqlheavy')
makedepends=('git' 'vala' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=('git+https://github.com/DreamDevel/eRadio.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  cmake --disable-gee-0.8 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ..
  make
}

package() {
  cd $_gitname/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et: