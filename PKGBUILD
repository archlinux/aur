# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pd-else
pkgver=1.0_rc6
pkgrel=1
_pdver=0.53-1
pkgdesc="ELSE externals for Pd"
arch=("i686" "x86_64")
license=('WTFPL')
url="https://github.com/porres/pd-else"
depends=('pd' 'fluidsynth')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/porres/pd-else/archive/refs/tags/v${pkgver//_/-}.tar.gz"
	"pure-data-$_pdver.tar.gz::https://github.com/pure-data/pure-data/archive/refs/tags/$_pdver.tar.gz")
md5sums=('6f5005da4d15a45885f117838b08c7ac'
         'f4cbd9dd37aa3f13f42bbb17476b5c55')

build() {
    cd $srcdir/pd-else-${pkgver//_/-}
    make pdincludepath=$srcdir/pure-data-$_pdver/src
    make -C sfont~ pdincludepath=$srcdir/pure-data-$_pdver/src
}

package() {
    cd $srcdir/pd-else-${pkgver//_/-}
    make DESTDIR="$pkgdir" PDLIBDIR=/usr/lib/pd/extra install
    make -C sfont~ DESTDIR="$pkgdir" installpath="$pkgdir/usr/lib/pd/extra/else" install
    install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
