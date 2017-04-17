# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname=autofirma
pkgver=1.4.2
pkgrel=1
pkgdesc='Spanish Government digital signature client'
arch=('i686' 'x86_64')
url='http://firmaelectronica.gob.es'
license=('GPL' 'EUPL')
depends=('java-runtime' 'nss' 'firefox')
makedepends=('binutils')
source=('http://estaticos.redsara.es/comunes/autofirma/currentversion/AutoFirma_Linux.zip')
md5sums=('ad388cfbea3ae49d073c528f120c1e2b')

prepare() {
	ar -x AutoFirma_${pkgver}.deb
	tar -xf data.tar.xz
}

package() {
	mkdir -p "${pkgdir}"/usr/lib/firefox/defaults/pref/
	cp -d --no-preserve=ownership etc/firefox/pref/AutoFirma.js "${pkgdir}"/usr/lib/firefox/defaults/pref/
	cp -dr --no-preserve=ownership usr "${pkgdir}"/

	rm "${pkgdir}"/usr/share/applications/afirma.desktop~
	mkdir -p "${pkgdir}"/usr/share/licenses/autofirma/
	ln -s /usr/share/doc/AutoFirma/copyright "${pkgdir}"/usr/share/licenses/autofirma/LICENSE

	chmod 644 "${pkgdir}"/usr/share/applications/afirma.desktop
	chmod 644 "${pkgdir}"/usr/share/doc/AutoFirma/copyright
}
