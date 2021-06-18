# Maintainer: Morganamilo <morganamilo@gmail.com>
pkgname=qmasterpassword
_pkgname=qMasterPassword
pkgver=1.2.2
pkgrel=3
pkgdesc="Stateless Master Password Manager"
arch=(x86_64)
url="https://github.com/bkueng/qMasterPassword"
license=('GPL3')
depends=("qt5-base" "libscrypt" "libxtst" "hicolor-icon-theme")
source=("${pkname}-${pkgver}::https://github.com/bkueng/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('daeb8055a689c770eae197356e43adf43b2e3de386e927522c90b55bdc01642e')

prepare() {
	cd "${_pkgname}-${pkgver}"
	sed -i "s/Exec=${_pkgname}/Exec=${pkgname}/g" "data/${_pkgname}.desktop"
}

build() {
	cd "${_pkgname}-${pkgver}"
	qmake
	make
}

package() {
	cd "${_pkgname}-${pkgver}"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "data/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "data/qMasterPassword.appdata.xml" -t "${pkgdir}/usr/share/appdata"

	install -Dm644 data/icons/* -t "${pkgdir}/usr/share/icons/${pkgname}"
	install -Dm644 "data/icons/app_icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
