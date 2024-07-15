# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=govarnam-ibus
_pkgname=varnam-ibus-engine
pkgname=${_base}-bin
pkgver=1.6.4
pkgrel=1
pkgdesc="IBus engine for GoVarnam providing Indian language input method"
arch=('x86_64')
url="https://www.varnamproject.com"
license=('MPL-1.1')
makedepends=('unzip')
depends=('govarnam' 'ibus')
provides=('govarnam-ibus')
source=("https://github.com/varnamproject/${_base}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch}.zip")
sha256sums=('cec750555023b3c3859f80f6840909ae7ac01ed051f6b30a83fa9ce1b326ecff')

prepare() {
	cd "${_pkgname}"-"${pkgver}"-"${arch}"
	sed -i 's#/usr/local/#/usr/#g' "component/varnam-bn.xml"
	sed -i 's#/usr/local/#/usr/#g' "component/varnam-hi.xml"
	sed -i 's#/usr/local/#/usr/#g' "component/varnam-kn.xml"
	sed -i 's#/usr/local/#/usr/#g' "component/varnam-ml-inscript.xml"
	sed -i 's#/usr/local/#/usr/#g' "component/varnam-ml.xml"
	sed -i 's#/usr/local/#/usr/#g' "component/varnam-ne.xml"
	sed -i 's#/usr/local/#/usr/#g' "component/varnam-ta.xml"
	sed -i 's#/usr/local/#/usr/#g' "component/varnam-te.xml"
	mv icons/varnam-ka.png icons/varnam-kn.png
}

package() {
	cd "${_pkgname}"-"${pkgver}"-"${arch}"

	install -Dm 755 varnam-ibus-engine "${pkgdir}/usr/bin/varnam-ibus-engine"

	mkdir -p "${pkgdir}/usr/share/varnam/ibus/icons"
	cp -a --no-preserve=ownership icons/*.png "${pkgdir}/usr/share/varnam/ibus/icons/"


	mkdir -p "${pkgdir}/usr/share/ibus/component"
	cp -a --no-preserve=ownership component/*.xml "${pkgdir}/usr/share/ibus/component"
}
