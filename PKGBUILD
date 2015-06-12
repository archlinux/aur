# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Nathan Dyer <https://launchpad.net/~nathandyer>

pkgname=vocal-bzr
pkgver=r286
pkgrel=1
pkgdesc='Vocal Podcast Manager. Simple Podcast Client for the Modern Desktop.'
arch=('i686' 'x86_64')
url='https://launchpad.net/vocal'
license=('GPL3')
depends=('libnotify' 'libunity-bzr' 'libxml2' 'granite' 'gtk3' 'gstreamer' 'sqlite3' 'clutter-gtk' 'icu')
makedepends=('bzr' 'vala' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=('bzr+lp:vocal')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "r%s" "$(bzr revno)"
}

build() {
  cd ${pkgname%-*}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${pkgname%-*}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
