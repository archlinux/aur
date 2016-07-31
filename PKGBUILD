# Maintainer: 8100d1r0n (echo "ODEwMGQxcjBuKGF0KXJpc2V1cChkb3QpbmV0Cg=="|base64 -d)
pkgname=gcompmgr
pkgver=0.21
pkgrel=9
pkgdesc="Graphical front end for xcompmgr"
arch=("i686" "x86_64")
license=("GPL")
url="http://sourceforge.net/projects/gcompmgr/"
depends=("gtkmm")
source=("http://sourceforge.net/projects/gcompmgr/files/gcompmgr/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")

build() {
        cd $srcdir/$pkgname-$pkgver/src
         sed -i -e 's|SigC::slot|sigc::mem_fun|' \
	        -e 's|#include <sigc++\/compatibility\.h>||' \
	        -e 's|#include "params.h"|#include "params.h"\n#include <cstring>|' \
	        -e 's|#include "stdxinc.h"|#include "stdxinc.h"\n#include <cstring>|' *.cc

	    #Change editor.
	    #sed -i 's|gedit|leafpad|g' window1.cc

	    cd $srcdir/$pkgname-$pkgver
	    CXX="g++  -std=c++11 -lX11 -O2"  ./autogen.sh --prefix=/usr
}
package() {
    	cd $srcdir/$pkgname-$pkgver/src
    	install -m755 -D gcompmgr $pkgdir/usr/bin/$pkgname
    	install -m644 -D ../README $pkgdir/usr/share/doc/$pkgname/README
}
sha256sums=('50b68e830248657a1123526b53191de024475b96679361bcff6f404c26548fa3')
