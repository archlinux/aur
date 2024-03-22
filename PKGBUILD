# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>

pkgname=brother-dcpt500w
pkgver=3.0.2
pkgrel=2
pkgdesc="Driver for the Brother DCP-T500W wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups' 'lib32-glibc') 
makedepends=('rpmextract')
install="brother-dcpt500w.install"
arch=('i686' 'x86_64')

md5sums=('6d76dd9b018d417e75a8eabb51dc3080'
         'd7cfc19a591c00378219059c6cc901df'
         '0741ac139077747bd4966c86d62d1f26')

source=(
	"fix_lp.patch" \
    "http://download.brother.com/welcome/dlf101954/dcpt500wlpr-$pkgver-0.i386.rpm" \
	"http://download.brother.com/welcome/dlf101955/dcpt500wcupswrapper-$pkgver-0.i386.rpm"
)

build() {
  cd "$srcdir"
	patch -Np0 < fix_lp.patch
}

post_install() {
	/opt/brother/Printers/dcpt500w/cupswrapper/cupswrapperdcpt500w
}

package()
{
    install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpt500w "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}
