# Maintainer: jx11r <jx11r@hotmail.com>
# Contributor: Martin Zecher Magni <mzecher@gmail.com>
# Strongly based on DCP-T500W PKGBUILD by Samuel Fernando Mesa Giraldo

pkgname=brother-dcpt300
pkgver=3.0.2
pkgrel=2
pkgdesc="Driver for the Brother DCP-T300 multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups' 'lib32-glibc')
install="brother-dcpt300.install"
arch=('i686' 'x86_64')

md5sums=('164dd5eaeb33bb89c5ba6a6a547b65b8'
         'a0299c04635a1db426f0d4c65200b3ab'
         'add52c42190a557a4294150a5a27905f')

source=(
	"fix_lp.patch" \
    "http://download.brother.com/welcome/dlf101958/dcpt300lpr-$pkgver-0.i386.rpm" \
	"http://download.brother.com/welcome/dlf101959/dcpt300cupswrapper-$pkgver-0.i386.rpm"
)

build() {
  cd "$srcdir"
	patch -Np0 < fix_lp.patch
}

post_install() {
	/opt/brother/Printers/dcpt300/cupswrapper/cupswrapperdcpt300
}

package()
{
    install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpt300 "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}
