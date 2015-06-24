# Maintainer: zoe <chp321@gmail.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
pkgname=brother-ql500-lpr
_pkgname=ql500lpr
pkgver=1.0.1
pkgrel=7
pkgdesc="Brother LPR driver for P-Touch QL-500 labelprinter"
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=("custom:brother")
depends=('cups' 'ghostscript')
makedepends=('rpmextract')
source=("http://www.brother.com/pub/bsc/linux/dlf/${_pkgname}-${pkgver}-0.i386.rpm"
        "license.txt"
        "lpr.install")
md5sums=('cfbe68328d8ef6afb1e05e6b7642f02f'
         '47cf89c2ae034aaf18ea0a6379c897da'
         'e64e7a8c9f8201221e814c81d8ba3796')
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
