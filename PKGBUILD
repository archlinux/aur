# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libfat-gba
pkgver=1.0.14
pkgrel=1
pkgdesc="Library for accessing FAT filesystems from Nintendo Gameboy Advance homebrew"
arch=('any')
url="http://chishm.drunkencoders.com/libfat/"
license=('custom')
depends=('libgba')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/libfat-src-$pkgver.tar.bz2")
sha256sums=('bfa7768d9a199b2a93e8aacf010f73df59bb7d029df95b7d176a83d9131d20cc')
options=(!strip staticlibs)

build() {
  source /etc/profile.d/devkitarm.sh
  make gba-release
}

package() {
  export DEVKITPRO="$pkgdir"/opt/devkitpro

  install -d "$DEVKITPRO"/libgba/{lib,include}
  make gba-install
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -n 30 include/fat.h > "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
