# Maintainer: Markus Tacker <m@coderbyheart.de>
# Based on the QL-700 PKGBUILD -> Andreas Wilhelm <info@avedo.net>
pkgname=brother-ql720nw-lpr
pkgver=1.0.2
pkgrel=0
pkgdesc="Brother LPR driver for P-Touch QL-720NW labelprinter"
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=("custom:brother")
depends=('cups' 'ghostscript')
makedepends=('rpmextract')
source=("http://download.brother.com/welcome/dlfp002203/ql720nwlpr-${pkgver}-$pkgrel.i386.rpm"
        'license.txt')
sha256sums=('376dd85f57bffa6c681dfbf7ebffce554f9c69ee23f191abf99c6ffc4e8ecdfb'
         '3bc1ec170d87992f379de83cb6e6ce775e88f31049f5cba7cdddc84d956fae0e')
noextract=("ql720nwlpr-$pkgver-$pkgrel.i386.rpm")
install='lpr.install'

build() {
        cd $srcdir
        rpmextract.sh "ql720nwlpr-$pkgver-$pkgrel.i386.rpm" || return 1
        rm "ql720nwlpr-$pkgver-$pkgrel.i386.rpm"
}

package() {
	mv usr opt $pkgdir/. || return 1
        install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}

