# Maintainer: David Adler <d.adler@posteo.de>
# Contributor: SpepS <dreamspepser at yahoo dot it>
pkgname=arpage
pkgver=0.3.3
pkgrel=11
pkgdesc="JACK MIDI arpeggiator with transport and tempo sync"
arch=('x86_64')
url="http://sourceforge.net/projects/arpage/"
license=('GPL')
depends=('jack' 'gtkmm' 'libxml++2.6')
makedepends=('intltool')
source=(http://downloads.sourceforge.net/project/arpage/Alpha%20Release%20$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('987070a6efb4c9e9f3dbe4ca43ddc6a4')

build() {
    cd $pkgname-$pkgver

    # fix for gcc 4.7  (undeclared sleep)
    sed -i 's/#include <cstdio>/&\n#include <unistd.h>/' src/jack_process.cc

    # fix XML syntax
    sed -i "s_\(arpeggiator\)/_/\1_" src/arpstorage.cc

    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install
}

