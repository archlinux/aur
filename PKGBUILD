# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=libntfs-wii
pkgver=2013.1.13
pkgrel=1
pkgdesc='NTFS-3G filesystem access library (for Nintendo Gamecube/Wii homebrew development)'
arch=('any')
url='http://code.google.com/p/libntfs-wii/'
license=('GPL')
options=(!strip staticlibs)
depends=('devkitppc')
makedepends=('svn')
source=($pkgname-$pkgver::"svn+http://libntfs-wii.googlecode.com/svn/tags/libntfs-$pkgver")
md5sums=('SKIP')

prepare() {
  cd $pkgname-$pkgver

  # fix install directory (not a portlib)
  sed 's|$(PORTLIBS)|$(DEVKITPRO)/libogc|;s|ogc/lib$|&/wii|' -i source/Makefile
}

build() {
  cd $pkgname-$pkgver

  source /etc/profile.d/devkitppc.sh
  make
}

package() {
  cd $pkgname-$pkgver

  export DEVKITPRO="$pkgdir/opt/devkitpro"
  install -d "$DEVKITPRO"/libogc/{include,lib/{cube,wii}}
  make wii-install cube-install
}
