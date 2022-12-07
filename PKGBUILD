# Maintainer: EndlessEden <eden.rose@deep-rose.org>
# glee: Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# glee: Contributor: speps <speps at aur dot archlinux dot org>
_pkgname=glee
pkgname=$_pkgname-svn
pkgver=5.5.0
pkgrel=1
pkgdesc='Free cross-platform extension loading library for OpenGL'
url='http://elf-stone.com/glee.php'
arch=('x86_64')
license=('custom:BSD')
depends=('gcc-libs' 'libgl' 'glu')
makedepends=('mesa')
provides=(glee)
conflicts=(glee)
source=("$pkgname::svn://svn.code.sf.net/p/glee/svn"
        $_pkgname.pc
        Makefile)
sha512sums=('SKIP'
            '84fd2e5923d808672c8220378e13e40d93a1f91a51a85a4fa44a8e571a7b0028eaa11ff69ba1c2e23323ed61247a33f9e3a2a3b0108d90ebf78274c39ef429c8'
            '98271cd1a4b034c664ba60a70828fc2fded66218e0839509fbd9d7d69c0e4bd8f01014f2fec87c8428006204a0e693b11d0b752181045dadd90e5de1cb13cf74')
            
pkgver() {
  cd "$srcdir"/"$pkgname"/DATA/output/
  MAJOR="$(cat "extensionList.txt" | head -2 | tail -1 | sed 's|GLee||g' | sed 's| |\n|g' | head -2 | tail -1)"
  MINOR="$()"
  if [ ! -z $MINOR ]; then
        echo $MAJOR.$MINOR
    else
        echo $MAJOR.0
  fi
}

prepare() {
    cd "$srcdir"/"$pkgname"/DATA/output
        cp "$srcdir"/Makefile ./
        cp "$srcdir"/"$_pkgname.pc" ./
        cp "$srcdir"/"$pkgname"/Readme.txt ./readme.txt
}

build() {
    cd $srcdir/$pkgname/DATA/output
        make
}

package() {
    cd $srcdir/$pkgname/DATA/output
        make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
