# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>
# Contributor: Tiago Camargo <tcamargo@gmail.com>

pkgname=libfat-ogc
pkgver=1.1.2
pkgrel=1
pkgdesc="Library for acessing FAT filesystems from Nintendo Gamecube/Wii homebrew"
arch=('any')
url="https://www.chishm.com/libfat/"
license=('custom')
depends=('libogc')
source=("https://github.com/devkitPro/libfat/releases/download/v$pkgver/libfat-src-$pkgver.tar.bz2")
sha256sums=('cf73ccdcec941b90481e26427b82a15ef7660adb05498f2e004e1b9956dae5bf')
options=(!strip staticlibs)

build() {
  # set environment
  source /etc/profile.d/devkitppc.sh

  make ogc-release
}

package() {
  export DEVKITPRO="$pkgdir"/opt/devkitpro

  install -d "$DEVKITPRO"/libogc/{lib/{cube,wii},include}
  make ogc-install
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -n 30 include/fat.h > "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
