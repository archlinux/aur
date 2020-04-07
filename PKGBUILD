# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_pkgbase=opendune
pkgname=$_pkgbase-git
pkgver=0.9.r33.g4ee71cf7
pkgrel=1
pkgdesc="Open source re-creation of the popular game Dune II"
arch=('i686' 'x86_64')
url="http://opendune.org"
license=('GPL2')
depends=('sdl2_image' 'alsa-lib' 'libpulse' 'hicolor-icon-theme')
makedepends=('git')
optdepends=('timidity++: midi music support')
conflicts=('opendune')
provides=('opendune')
install=$_pkgbase.install
source=($_pkgbase::"git+https://github.com/OpenDUNE/OpenDUNE.git"
        "$_pkgbase.desktop")
sha256sums=('SKIP'
            'b80429ce421d6f781b1ef0c7c50293cf5970225e8de0fd6e379290d1fd91d4d7')

pkgver() {
  cd $_pkgbase

  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cd $_pkgbase

  ./configure --prefix-dir=/usr --binary-dir=bin
  make
}

package() {
  cd $_pkgbase

  make INSTALL_DIR="$pkgdir" install

  # install sample config and desktop file
  install -m644 bin/opendune.ini.sample "$pkgdir"/usr/share/doc/opendune
  install -Dm644 ../$_pkgbase.desktop "$pkgdir"/usr/share/applications/$_pkgbase.desktop
}
