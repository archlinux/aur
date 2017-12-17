# Maintainer: Morgana <morganamilo@gmail.com>
pkgname=superproductivity
_pkgname=superProductivity
pkgver=1.6.17
pkgrel=1
pkgdesc='To Do List / Time Tracker with Jira Integration.'
arch=('x86_64')
url="http://super-productivity.com/"
license=('MIT')
depends=('gtk2' 'libxss' 'gconf' 'nss' 'nspr' 'libnotify' 'libappindicator' 'libxtst' 'alsa-lib')
makedepends=()
source=("https://github.com/johannesjo/super-productivity/releases/download/v${pkgver}/superProductivity_${pkgver}_amd64.deb" "LICENSE")
noextract=()
md5sums=('be506d71996cbe361a50150e49d4c05c' '66b9e0d3d2b55636d9687b1381f5f97d')

prepare() {
	cd ${srcdir}
	tar -xf data.tar.xz
}

package() {
	cd ${srcdir}
	install -d "${pkgdir}/opt/${_pkgname}"
	cp -a "${srcdir}/opt/${_pkgname}/." "${pkgdir}/opt/${_pkgname}"
	
	chmod 755 "${pkgdir}/opt/${_pkgname}/${pkgname}"

	install -d "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	for size in 16 24 32 48 64 96 128 256 512; do
        	install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    	done

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
