# Maintainer: Morgana <morganamilo@gmail.com>
pkgname=qmasterpassword
_pkgname=qMasterPassword
pkgver=1.2.2
pkgrel=2
pkgdesc="stateless Master Password Manager"
arch=(x86_64)
url="https://github.com/bkueng/qMasterPassword"
license=('GPL')
depends=("qt5-base" "libscrypt" "libxtst")
source=("https://github.com/bkueng/qMasterPassword/archive/v1.2.2.tar.gz")
md5sums=('3ff8f256a81c30518bce959ea88f3c3d')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed -i "s/Exec=${_pkgname}/Exec=${pkgname}/g" "data/${_pkgname}.desktop"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	qmake
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "data/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	install -d "${pkgdir}/usr/share/icons"
	cp -a "data/icons" "${pkgdir}/usr/share/icons/${pkgname}"

	install -Dm644 "data/icons/app_icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
