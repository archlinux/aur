pkgname='scinterface-bin'
pkgver='6.4.4.469'
pkgrel='1'
pkgdesc='cryptovision software to use the RUB (Ruhr-Uni-Bochum) student identity card.'
url='https://web-rubicon.ruhr-uni-bochum.de/rubicon/download/rubcard.html'
arch=('x86_64' 'i686')
license=('custom')
depends=('pcsclite')
makedepends=('deb2targz')
#install="${pkgname}.install"
source=("https://web-rubicon.ruhr-uni-bochum.de/rubicon/download/files/rubcard/scInterface-${pkgver}-Ubuntu14-${CARCH}.deb")

if [[ "$CARCH" == 'x86_64' ]]; then
	sha256sums=('19df49045828223f559dab81859d6b02c0cd708c94da661ac89101fa148c2f82')
else
	sha256sums=('4f7be9bd6c7a82e6d8180be0548fbd1e7d7976b5580673e33508a57b8e3aed78')
fi

_installpath='/usr/local'

package() {
	deb2targz scInterface-${pkgver}-Ubuntu14-${CARCH}.deb
	mkdir -p ${srcdir}/${pkgname}-${pkgver} 
	tar -xzf scInterface-${pkgver}-Ubuntu14-${CARCH}.tar.gz -C ${srcdir}/${pkgname}-${pkgver}/
	cd ${srcdir}/${pkgname}-${pkgver}/usr/local/

	install -Dm 644 share/doc/scinterface/license-6.4.4.txt ${pkgdir}/usr/share/licenses/${pkgname}/license-6.4.4.txt

	# has to be in /usr/local/share/doc/scinterface/ to be found by the gui
	install -Dm 644 share/doc/scinterface/cv_act_sc_interface_DE.pdf ${pkgdir}${_installpath}/share/doc/scinterface/cv_act_sc_interface_DE.pdf
	install -Dm 644 share/doc/scinterface/cv_act_sc_interface_EN.pdf ${pkgdir}${_installpath}/share/doc/scinterface/cv_act_sc_interface_EN.pdf

	install -Dm 644 lib/libcvP11.so ${pkgdir}${_installpath}/lib/libcvP11.so
	install -Dm 755 bin/scManager ${pkgdir}${_installpath}/bin/scManager
	install -Dm 755 bin/SmartcardUtility ${pkgdir}${_installpath}/bin/SmartCardUtility

	cp -a share/icons ${pkgdir}${_installpath}/share/icons/
	cp -a share/locale ${pkgdir}${_installpath}/share/locale/
	cp -a share/applications ${pkgdir}${_installpath}/share/applications/
}

# vim:set ts=2 sw=2 et:
