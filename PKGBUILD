# Maintainer: freaknils <freaknils@gmail.com>
pkgname=brother-ql570-lpr
_pkgname=ql570lpr
pkgver=1.0.1
pkgrel=0
pkgdesc="Brother LPR driver for P-Touch QL-570 labelprinter"
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=("custom:brother")
depends=('cups' 'ghostscript')
makedepends=('rpmextract')
source=("http://www.brother.com/pub/bsc/linux/dlf/${_pkgname}-${pkgver}-0.i386.rpm"
        "license.txt"
        "lpr.install")
md5sums=('ea32120c3e1af205a6e1f5063cf08e88'
         '2dd475194e7a908c8e781682d7483f9f'
         '903f4732484f40ad4cf9b3f79b43a696')
noextract=("${_pkgname}-$pkgver-0.i386.rpm")
install='lpr.install'

build() {
        cd $srcdir
        rpmextract.sh "${_pkgname}-$pkgver-0.i386.rpm" || return 1
        rm "${_pkgname}-$pkgver-0.i386.rpm"
        
        mkdir -p usr/share/ || return 1
        rm -rf usr/share/brother
        mv opt/brother usr/share/brother || return 1
        rmdir opt || return 1
}

package() {
	mv usr $pkgdir/. || return 1
        install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}
