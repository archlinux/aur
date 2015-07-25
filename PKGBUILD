# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Andreas Wilhelm <info@avedo.net>
# Contributor:  Jacob Alexander <haata@kiibohd.com>
pkgname=brother-ql700-lpr
pkgver=1.0.2
pkgrel=1
_brotherrel=0
pkgdesc="Brother LPR driver for P-Touch QL-700 labelprinter"
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=("custom:brother")
depends=('cups' 'ghostscript')
makedepends=('rpmextract')
source=("http://download.brother.com/welcome/dlfp002191/ql700lpr-$pkgver-$_brotherrel.i386.rpm"
        'license.txt')
md5sums=('02de7a3196102f10529292df5570206f'
         '359f7683d7ce10e079998934a86dc144')
noextract=("ql700lpr-$pkgver-$_brotherrel.i386.rpm")
install='brother-ql700-lpr.install'

build() {
        cd $srcdir
        rpmextract.sh "ql700lpr-$pkgver-$_brotherrel.i386.rpm" || return 1
        rm "ql700lpr-$pkgver-$_brotherrel.i386.rpm"
}

package() {
	mv usr opt $pkgdir/. || return 1
        install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}
