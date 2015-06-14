# Maintainer: freaknils <freaknils@gmail.com>
pkgname=lib32-brother-ql570-cupswrapper
_pkgname=ql570cupswrapper
pkgver=1.0.1
pkgrel=0
pkgdesc="LPR-to-CUPS wrapper for Brother P-Touch QL-570 labelprinter (metric)"
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=("GPL2")
depends=('cups' 'ghostscript' 'lib32-glibc' 'brother-ql570-lpr')
makedepends=('rpmextract')
source=("http://www.brother.com/pub/bsc/linux/dlf/${_pkgname}-${pkgver}-0.i386.rpm"
        "cupswrapper.install")
md5sums=('9245b4bb5a51aa342c0ca4181bff078a'
         '0d68b60c5cd5b14de5533d5544102614' )
noextract=("${_pkgname}-${pkgver}-0.i386.rpm")
install='cupswrapper.install'

build() {
        cd $srcdir
        rpmextract.sh "${_pkgname}-${pkgver}-0.i386.rpm"

        rm -f ${_pkgname}-${pkgver}-0.i386.rpm

        mkdir -p usr/share/ || return 1
        rm -rf usr/share/brother 
        mv opt/brother usr/share/brother || return 1
        rmdir opt || return 1

        sed -i 's|/opt/brother|/usr/share/brother|g' `grep -lr '/opt/brother' ./` || return 1
}

package() {
	mv usr $pkgdir/. || return 1
}

