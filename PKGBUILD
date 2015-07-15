# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=sigasi
pkgver=2.28
pkgrel=1
pkgdesc='IDE for VHDL editing and browsing'
arch=('i686' 'x86_64')
url='http://www.sigasi.com/'
license=('custom')
source_x86_64=("http://download.sigasi.com/updates/sigasi-hdt2/com.sigasi.hdt.product-linux.gtk.x86_64.zip")
source_i686=("http://download.sigasi.com/updates/sigasi-hdt2/com.sigasi.hdt.product-linux.gtk.x86.zip")
source=('sigasi.desktop')
depends=('glib2')
sha256sums=('a8084b3146904c2accd5946e2aa493e133c56e4f8f0d7f582a0edcb080a7958c')
sha256sums_i686=('193b6ccb3fed539fdfc9c31210edc6cae258b7c5221ccf29f5b6bf1f866e9392')
sha256sums_x86_64=('ff53be5cb4bf849ac74bf7f59bbc3adcd8da2805df8ee6b37add3535ed6a6062')

package() {
	cd "${srcdir}/"

	install -d -m755 "${pkgdir}/opt/"
	install -d -m755 "${pkgdir}/usr/share/applications/"
	install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
	install -d -m755 "${pkgdir}/usr/bin/"
	cp -a sigasi "${pkgdir}/opt/"

	unzip -qjo "sigasi/plugins/com.sigasi.hdt.product.plugin_${pkgver}*.jar" icons/si128.png
	install -m644 si128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/sigasi.png"
	install -m644 "${srcdir}/sigasi.desktop" "${pkgdir}/usr/share/applications/"

	install -D -m644 sigasi/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

	rm -rf "${pkgdir}/opt/sigasi/jre"

	cd "${pkgdir}/usr/bin/"
	ln -s ../../opt/sigasi/sigasi sigasi
}
