# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libfat-gba
pkgver=1.1.2
pkgrel=1
pkgdesc="Library for accessing FAT filesystems from Nintendo Gameboy Advance homebrew"
arch=('any')
url="https://www.chishm.com/libfat/"
license=('custom')
depends=('libgba')
source=("https://github.com/devkitPro/libfat/releases/download/v$pkgver/libfat-src-$pkgver.tar.bz2")
sha256sums=('cf73ccdcec941b90481e26427b82a15ef7660adb05498f2e004e1b9956dae5bf')
options=(!strip staticlibs)

build() {
  # set environment
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
