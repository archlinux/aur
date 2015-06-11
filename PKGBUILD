# Maintainer: Erik Westrup <erik.westrup@gmail.com>

pkgname=brother-dcp7070dw-cups
pkgver=2.0.4_2
pkgrel=3
pkgdesc="Brother DCP-7070DW CUPS drivers."
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/downloadtop.aspx?c=eu_ot&lang=en&prod=dcp7070dw_eu"
license=('GPL2' 'custom:brother')
depends=('brother-dcp7070dw-lpr' 'cups')
makedepends=('rpmextract')
optdepends=('brscan4: scanner support.')
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=( "http://www.brother.com/pub/bsc/linux/dlf/cupswrapperDCP7070DW-${pkgver/_/-}.i386.rpm")
noextract=("cupswrapperDCP7070DW-${pkgver/_/-}.i386.rpm")
md5sums=('a67e6e62d8b768b958c0cebf97064c94')

prepare() {
	rpmextract.sh cupswrapperDCP7070DW-${pkgver/_/-}.i386.rpm
}

build() {
	sed -i -e 's$/etc/init.d/cups$/etc/rc.d/cupsd$g' -e 's$/etc/init.d$/etc/rc.d$g' "usr/local/Brother/Printer/DCP7070DW/cupswrapper/cupswrapperDCP7070DW-${pkgver%_*}"
}

package() {
	cp -r ${srcdir}/usr ${pkgdir}/
}
