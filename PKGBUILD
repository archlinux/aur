# Contributor: Dekat <felix dot vonthron arobase gmail dot com>
# Maintainer: Dekat <felix dot vonthron arobase gmail dot com>

pkgname=brother-dcpj525w
pkgver=3.0.1
pkgrel=4
pkgdesc="Driver for the Brother DCP-J525W wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups' 'brscan4')
install="brother-dcpj525w.install"
arch=('i686' 'x86_64')

md5sums=('b92cace621e8bc34c7ba83b7574bedd0'
         '6e9a5f01a51dbae298b41494a12f6fef')

source=(
    "https://download.brother.com/welcome/dlf005602/dcpj525wlpr-3.0.1-1.i386.rpm" \
    "https://download.brother.com/welcome/dlf005604/dcpj525wcupswrapper-3.0.0-1.i386.rpm"
)

post_install() {
	/opt/brother/Printers/dcpj525w/cupswrapper/cupswrapperdcpj525w

    # Scanner
    echo "For network scanners, please run following command :"
    echo "brsaneconfig4 -a name=\"Brother_DCP-J525W\" model=\"DCP-J525W\" ip=YOUR.SCANNER.IP.HERE"
}

package()
{
    install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj525w "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}
