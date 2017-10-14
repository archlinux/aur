# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gerardo Marset <gammer1994@gmail.com>
# Contributor: Aaron Lindsay <aerial9@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Alain

pkgname=libfat-nds
pkgver=1.1.2
pkgrel=1
pkgdesc="Library for accessing FAT filesystems from Nintendo DS homebrew"
arch=('any')
url="https://www.chishm.com/libfat/"
license=('custom')
depends=('libnds')
source=("https://github.com/devkitPro/libfat/releases/download/v$pkgver/libfat-src-$pkgver.tar.bz2")
sha256sums=('cf73ccdcec941b90481e26427b82a15ef7660adb05498f2e004e1b9956dae5bf')
options=(!strip staticlibs)

build() {
  # set environment
  source /etc/profile.d/devkitarm.sh

  make nds-release
}

package() {
  export DEVKITPRO="$pkgdir"/opt/devkitpro

  install -d "$DEVKITPRO"/libnds/{lib,include}
  make nds-install
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -n 30 include/fat.h > "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
