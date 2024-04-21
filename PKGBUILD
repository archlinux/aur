# Maintainer: Marcel Hasler <mahasler at gmail dot com>
pkgname=plasma6-applets-mpdnowplaying
_pkgname=mpdnowplaying
pkgver=0.6
pkgrel=2
pkgdesc="MPD plasmoid for Plasma 6."
arch=('x86_64')
url="https://github.com/marcelh83/mpdnowplaying"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'qt6-base' 'qt6-declarative' 'kirigami' 'plasma5support' 'libplasma' 'libmpdclient')
makedepends=('extra-cmake-modules')
conflicts=("plasma5-applets-mpdnowplaying" "${pkgname}")
provides=("${pkgname}")
source=("mpdnowplaying-0.6.tar.gz::https://github.com/marcelh83/mpdnowplaying/archive/refs/tags/v0.6.tar.gz")
sha256sums=('141ff66ec3dd43a66b5ea22887fec761b962120316f0e021f548ccbdc76fd759')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=$(/usr/lib/qt6/bin/qtpaths6 --install-prefix)
  make
}

package() {
  cd build
  make install DESTDIR="${pkgdir}"
}
