# Maintainer: Frederic Van Assche <frederic@fredericva.com>
# Maintainer: Max Klein <max@maxkl.de>

pkgname=sigasi
pkgver=5.3.0
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
sha1sums=('eda4ea0ad298e3cf5f1e1f0f5b632e30ac0f0282'
          '99dfc8c07414ab73f921bdeba790a70715624f35')

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
