# Maintainer: Morgana <morganamilo@gmail.com>

pkgname=duolingo-desktop-git
_pkgname=duolingo-desktop
pkgver=20200524
pkgrel=1
pkgdesc="Desktop client for Duolingo, using Electron"
arch=(x86_64)
url="https://github.com/hmlendea/duolingo-desktop"
license=('GPL')
depends=('gtk2' 'libxss' 'gconf' 'nss' 'nspr' 'libxtst' 'alsa-lib')
makedepends=('npm' 'python2' 'git')
source=("git+https://github.com/hmlendea/duolingo-desktop" "duolingo-desktop.desktop")
md5sums=("SKIP" "a28956619c5618f993feb417e9fa8dfc")

build() {
	cd ${srcdir}/${_pkgname}
	npm install
	npm run build -- --dir
}

package() {
	cd ${srcdir}/${_pkgname}

	install -d "${pkgdir}/opt/${_pkgname}"
	cp -a "${srcdir}/${_pkgname}/dist/linux-unpacked/." "${pkgdir}/opt/${_pkgname}"

	chmod 755 "${pkgdir}/opt/${_pkgname}/${_pkgname}"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -d "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications"

	install -Dm644 "${srcdir}/${_pkgname}/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/duolingo.png" 

	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"	
	install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"	
}

pkgver() {
  date +%Y%m%d
}
