# Contributor: Alessio Bianchi <venator85@gmail.com>
# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
# Contributor: Javier Cordero <jneight@gmail.com>
# Contributor: M. Arnout <marnout at free.fr>
# Maintainer: M. Arnout <marnout at free.fr>

pkgname=brother-dcpj140w
pkgver=1.1.3
pkgrel=3
pkgdesc="Driver for the Brother DCP-j140w wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
install="brother-dcpj140w.install"
arch=('i686' 'x86_64')

md5sums=('69229583e5d43d82e5655f74729c05ba'
         '599a7667f2c805d5dbc2fa655832f17c'
         'fa2d50677492bfc83e27184f316061c3')

source=(
   "fix_lp.patch" \
   "http://www.brother.com/pub/bsc/linux/dlf/dcpj140wlpr-$pkgver-6.i386.rpm" \
	"http://www.brother.com/pub/bsc/linux/dlf/dcpj140wcupswrapper-$pkgver-6.i386.rpm"
)

build() {
   cd "$srcdir"
   patch -Np0 < fix_lp.patch
}

post_install() {
   /opt/brother/Printers/dcpj140w/cupswrapper/cupswrapperdcpj140w
}

package()
{
   install -d $pkgdir/usr/bin
   install -d $pkgdir/var/spool/lpd
   install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj140w "$pkgdir"/usr/bin/
   cp -R $srcdir/opt $pkgdir/opt
}
