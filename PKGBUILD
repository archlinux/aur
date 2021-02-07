# Maintainer: Henry Jenkins <archlinux.org@henryjenkins.com>
# Upstream URL: https://github.com/mhostetter/gr-adsb
# Modified from gr-osmosdr-git PKGBUILD

pkgname=gr-adsb-git
pkgver=0f6ffd
pkgrel=1
pkgdesc="GNURadio blocks for receiving ADS-B modulated radio messages using SDR"
arch=('i686' 'x86_64')
url="https://github.com/mhostetter/gr-adsb"
license=('GPL-3.0 License')
depends=('gnuradio>=3.8.0')
makedepends=(
  'git'
  'cmake'
)
provides=('gr-adsb')
source=('gr-adsb::git+https://github.com/mhostetter/gr-adsb#branch=maint-3.8')
sha256sums=('SKIP')
_gitname=gr-adsb

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g; s|^.||'
}

build() {
  cd "$srcdir/$_gitname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$_gitname/build/"
  make DESTDIR=${pkgdir} install
}
