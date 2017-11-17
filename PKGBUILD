# Contributor: Alessio Bianchi <venator85@gmail.com>
# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
# Contributor: Javier Cordero <jneight@gmail.com>
# Contributor: Vieux Grognon <vieux@grognon.net>
# Maintainer: Vieux Grognon <vieux@grognon.net>

pkgname=brother-mfcj245
pkgver=3.0.0
pkgrel=1
pkgdesc="Driver for the Brother DCP-j245 wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
makedepends=('rpmextract')
install="brother-mfcj245.install"
arch=('i686' 'x86_64')

md5sums=('b890daa9317b3cbec2e0a077b4be221f'
         '514702c4b09b195a1a6fbe67f8327bd9'
         '31c4664b7f0eb6751decf1d04819c100')

source=(
	"./fix_lp.patch" \
    "http://www.brother.com/pub/bsc/linux/dlf/mfcj245lpr-3.0.0-1.i386.rpm" \
	"http://www.brother.com/pub/bsc/linux/dlf/mfcj245cupswrapper-3.0.0-1.i386.rpm"
)

build() {
  cd "$srcdir"
	patch -Np0 < fix_lp.patch
}

post_install() {
	/opt/brother/Printers/mfcj245/cupswrapper/cupswrappermfcj245
}

package()
{
    install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_mfcj245 "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}

