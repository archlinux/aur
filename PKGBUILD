pkgname='scinterface-bin'
pkgver='6.1.6.415'
pkgrel='1'
pkgdesc='cryptovision software to use the RUB (Ruhr-Uni-Bochum) student identity card.'
url='https://web-rubicon.ruhr-uni-bochum.de/rubicon/download/rubcard.html'
arch=('x86_64' 'i686')
license=('custom')
depends=('pcsclite')
makepdepends=('deb2targz')
#install="${pkgname}.install"
source=("https://web-rubicon.ruhr-uni-bochum.de/rubicon/download/files/rubcard/scInterface-${pkgver}-Ubuntu12-${CARCH}.deb")

if [[ "$CARCH" == 'x86_64' ]]; then
	sha256sums=('45a8a2ee4cdc74547a98586dd6940a7339f6924c4347db793c605c0638145a2a')
else
	sha256sums=('41e5ce99cf9de7f15980338803ea077c07d506e07b9dab9d36adb09877e3a3ce')
fi

_installpath='/usr/local'

package() {
	deb2targz scInterface-${pkgver}-Ubuntu12-${CARCH}.deb
	mkdir -p ${srcdir}/${pkgname}-${pkgver} 
	tar -xzf scInterface-${pkgver}-Ubuntu12-${CARCH}.tar.gz -C ${srcdir}/${pkgname}-${pkgver}/
	cd ${srcdir}/${pkgname}-${pkgver}/usr/local/

	install -Dm 644 share/doc/license-6.1.6.txt ${pkgdir}/usr/share/licenses/${pkgname}/license-6.1.6.txt

	# has to be in /usr/local/share/doc/ to be found by the gui
	install -Dm 644 share/doc/cv_act_sc_interface_DE.pdf ${pkgdir}${_installpath}/share/doc/cv_act_sc_interface_DE.pdf
	install -Dm 644 share/doc/cv_act_sc_interface_EN.pdf ${pkgdir}${_installpath}/share/doc/cv_act_sc_interface_EN.pdf

	if [[ "$CARCH" == 'x86_64' ]]; then
		install -Dm 644 lib64/libcvP11.so ${pkgdir}${_installpath}/lib64/libcvP11.so
	else
		install -Dm 644 lib/libcvP11.so ${pkgdir}${_installpath}/lib/libcvP11.so
	fi

	install -Dm 755 bin/scManager ${pkgdir}${_installpath}/bin/scManager
	install -Dm 755 bin/SmartcardUtility ${pkgdir}${_installpath}/bin/SmartCardUtility

	cp -a share/icons ${pkgdir}${_installpath}/share/icons/
	cp -a share/locale ${pkgdir}${_installpath}/share/locale/
	cp -a share/applications ${pkgdir}${_installpath}/share/applications/
}

# vim:set ts=2 sw=2 et:
