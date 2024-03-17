pkgname=115pc
pkgver=2.0.9.3
pkgrel=1
epoch=
pkgdesc="115.com PC client"
arch=('x86_64')
url="https://pc.115.com/"
license=('Proprietary')
makedepends=('tar')
options=(!strip)
source=(
    "https://down.115.com/client/${pkgname}/lin/${pkgname}_${pkgver}.deb"
    "115.desktop"
    "115pc"
)
sha256sums=('390382ad1a36eb2c229cfa8345be66d66062d471d3d253d878ac89d7cfa6f5a2'
            'd18207d8f111d5dbd894a17782f421d611262b823bc9e303e7de603ee762181d'
            '84a7e0f5ba046fb199edcc63e48b12f39fb093c205cbc242a905333f7b7d02c5')

package() {
        tar -C ${srcdir} -xf data.tar.xz
	mkdir -p ${pkgdir}/opt/
	install -Dm644 ${srcdir}/115.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
        install -Dm644 ${srcdir}/usr/local/115/res/115.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/115pc.png
	cp -rT ${srcdir}/usr/local/115 ${pkgdir}/opt/${pkgname}

	# permission tweaks
	chmod a+x ${pkgdir}/opt/115pc/libexec/QtWebEngineProcess

	install -Dm755 ${srcdir}/115pc ${pkgdir}/usr/bin/115pc
}
