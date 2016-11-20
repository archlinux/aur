# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libext2fs-wii
pkgver=1.0.5
pkgrel=2
pkgdesc='Ext2/3/4 filesystem access library (for Nintendo Gamecube/Wii homebrew development)'
arch=('any')
url='https://sourceforge.net/projects/libext2fs-wii/'
license=('GPL')
options=(!strip staticlibs)
depends=('devkitppc')
makedepends=('svn')
source=($pkgname-$pkgver::"svn+http://svn.code.sf.net/p/libext2fs-wii/code/tags/v$pkgver"
        "$pkgname-fix_crc32_int_type.patch")
sha256sums=('SKIP'
            'cd3b4e9e683b25095b6da85074402668066c4accab87a68184b4e9acf8ebb0b0')

prepare() {
  patch -Np0 < $pkgname-fix_crc32_int_type.patch
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
  make install
}
