# Contributor: Alessio Bianchi <venator85@gmail.com>
# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
# Contributor: Javier Cordero <jneight@gmail.com>
# Contributor: M. Arnout <marnout at free.fr>
# Contributor: Adam Nych <adam@nych.me>
# Maintainer: Adam Nych <adam@nych.me>

pkgname=brother-dcpj100-lpr-cups-bin
pkgver=3.0.0
pkgrel=3
pkgdesc="Driver for the Brother DCP-J100 multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
install="brother-dcpj100.install"
arch=('i686' 'x86_64')

md5sums=('ee9f4388a008467c4f65f5aa3883c764'
         'c5add66bcef0f7d95498c44d2c7ba68a'
         '33486e8669dd77b0b88711d1b84218fd')

source=(
   "fix_lp.patch" \
   "https://download.brother.com/welcome/dlf100906/dcpj100lpr-$pkgver-1.i386.rpm" \
	"https://download.brother.com/welcome/dlf100908/dcpj100cupswrapper-$pkgver-1.i386.rpm"
)

build() {
   cd "$srcdir"
   patch -Np0 < fix_lp.patch
}

post_install() {
   /opt/brother/Printers/dcpj100/cupswrapper/cupswrapperdcpj100
}

package()
{
   install -d $pkgdir/usr/bin
   install -d $pkgdir/var/spool/lpd
   install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj100 "$pkgdir"/usr/bin/
   cp -R $srcdir/opt $pkgdir/opt
}
