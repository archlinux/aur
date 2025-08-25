# Maintainer: mooow <9mvnyapkt@mozmail.com>
# Thanks: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Thanks: Jared Casper <jaredcasper@gmail.com>
# Thanks: Kyle Keen <keenerd@gmail.com>
# Thanks: Markus Koch <CClassicVideos@aol.com>
# Thanks: Thomas Dziedzic < gostrc at gmail >

pkgname=gtkwave-gtk3-tcl
pkgver=3.3.124
pkgrel=1
pkgdesc="A wave viewer which reads LXT, LXT2, VZT, GHW and VCD/EVCD files (GTK+ 3 version, with Tcl/Tk support)"
arch=('x86_64')
url="http://gtkwave.sourceforge.net"
license=('GPL-2.0-or-later AND MIT')
depends=('bzip2' 'xz' 'gtk3' 'dconf' # Original gtkwave dependencies
'tcl' 'tk'
)
makedepends=('gperf')
conflicts=(gtkwave)
provides=(gtkwave)
install='gtkwave.install'
source=("https://downloads.sourceforge.net/project/gtkwave/gtkwave-gtk3-${pkgver}/gtkwave-gtk3-${pkgver}.tar.gz")
sha256sums=('4b1590e05e3e3ae26e34fa80aff369254397379b2f970cfa99150b8b97e535cf')

build() {
	cd "gtkwave-gtk3-${pkgver}/"
	./configure \
		--prefix=/usr \
		--enable-tcl \
		--disable-mime-update \
		--with-gsettings \
		--enable-gtk3

	make
}

package() {
	cd "gtkwave-gtk3-${pkgver}/"
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE.TXT -t "${pkgdir}/usr/share/licenses/gtkwave/"
}
