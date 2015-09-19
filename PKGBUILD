# Maintainer: Max Kueng <me [at] maxkueng [dot] com>
pkgname=brother-ql650td-lpr
_pkgname=ql650tdlpr
pkgver=1.0.1
pkgrel=1
pkgdesc="Brother LPR driver for P-Touch QL-650TD labelprinter"
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=("custom:brother")
depends=('cups' 'ghostscript')
makedepends=('rpmextract')
source=("http://www.brother.com/pub/bsc/linux/dlf/${_pkgname}-${pkgver}-0.i386.rpm"
        "license.txt"
        "lpr.install")
sha256sums=('371301a0c297bb0879f387ab709f60304376d2a94ae9989c05f3ee86b8a0971d'
            '3bc1ec170d87992f379de83cb6e6ce775e88f31049f5cba7cdddc84d956fae0e'
            '8213786297ddcd4f20b84bbfd4c4f9e0a2b8efdcd85ee2984de127a98da17e9f')
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
