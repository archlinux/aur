# Maintainer: Frederic Van Assche <frederic@fredericva.com>
# Maintainer: Max Klein <max@maxkl.de>

pkgname=sigasi
pkgver=5.0.0
pkgrel=1
pkgdesc='Eclipse-based commercial VHDL, Verilog and SystemVerilog IDE'
arch=('x86_64')
url='http://www.sigasi.com/'
license=('custom')
source=("${pkgname}-${pkgver}-x86_64.zip::http://download.sigasi.com/updates/${pkgver}/com.sigasi.hdt.product-linux.gtk.x86_64.zip"
        'sigasi.desktop')
depends=('glib2' 'jre11-openjdk' 'gtk3' 'webkit2gtk')
makedepends=('unzip')
options=('!strip')
sha256sums=('fadb4a3da1701184f0b33c761569449074a8c137fed29ebfe4a2af949a48eb61'
            'a8084b3146904c2accd5946e2aa493e133c56e4f8f0d7f582a0edcb080a7958c')

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
