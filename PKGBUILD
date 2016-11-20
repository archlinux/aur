# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libntfs-wii
pkgver=2013.1.13
pkgrel=2
pkgdesc='NTFS-3G filesystem access library (for Nintendo Gamecube/Wii homebrew development)'
arch=('any')
url='https://sourceforge.net/projects/libntfs-wii/'
license=('GPL')
options=(!strip staticlibs)
depends=('devkitppc')
makedepends=('svn')
source=($pkgname-$pkgver::"svn+http://svn.code.sf.net/p/libntfs-wii/code/tags/libntfs-$pkgver")
md5sums=('SKIP')

prepare() {
  cd $pkgname-$pkgver

  # fix install directory (not a portlib)
  sed 's|$(PORTLIBS)|$(DEVKITPRO)/libogc|;s|ogc/lib$|&/wii|' -i source/Makefile
}

build() {
  cd $pkgname-$pkgver

  # set environment
  source /etc/profile.d/devkitppc.sh

  make
}

package() {
  cd $pkgname-$pkgver

  export DEVKITPRO="$pkgdir/opt/devkitpro"
  install -d "$DEVKITPRO"/libogc/{include,lib/{cube,wii}}
  make wii-install cube-install
}
