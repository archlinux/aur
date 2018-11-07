# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgbase=cle4vdr
pkgname=('cle4vdr-gtk2' 'cle4vdr-qt4')
pkgver=0.6.0
pkgrel=1
pkgdesc='A channel list editor for VDR'
arch=('x86_64' 'i686')
url='http://cle4vdr.vdr-developer.org'
license=('GPL2')
makedepends=('gtk2' 'lazarus' 'qt4pas')
source=("${url}/files/${pkgbase}.${pkgver}-src.tgz"
        "${pkgbase}-gtk2.desktop"
        "${pkgbase}-qt4.desktop"
        "${pkgbase}.png")
sha256sums=('885ab11c9c6c4f2da343edabdcfd2db6ae8b41cc845b8ba97a457e3fbb69b66f'
            '06b00ddecf199f5e26516a479ab8d5d04b60ed82b2cf8579ad7da6b6e039ba94'
            '46fbfc918c51905d71656aba9c0a6e2e4799c85bc6cb26be5439f3a7a6e1ceb8'
            '7b57db0232917296160f7cc64182504144d43fa437380bf9881dd7e673fe6698')

build() {
	cd ${srcdir}/${pkgbase}.${pkgver}-src
	lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=gtk2 ${pkgbase}.lpi
	mv ${pkgbase} ${pkgbase}-gtk2
	lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=qt ${pkgbase}.lpi
	mv ${pkgbase} ${pkgbase}-qt4
}

package_cle4vdr-gtk2() {
	depends=('gtk2')
	provides=("${pkgbase}")

	cd ${srcdir}/${pkgbase}.${pkgver}-src
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 ${srcdir}/${pkgbase}.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png
	install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

package_cle4vdr-qt4() {
	depends=('qt4pas')
	provides=("${pkgbase}")

	cd ${srcdir}/${pkgbase}.${pkgver}-src
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 ${srcdir}/${pkgbase}.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png
	install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
