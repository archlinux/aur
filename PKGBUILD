# Maintainer: Peter Kaplan <peter@pkap.de>

_pkgname='windows95'
pkgname="${_pkgname}-electron-bin"
pkgver=3.1.1
pkgrel=1
pkgdesc='Windows 95, running in an Electron app'
arch=('x86_64')
url='https://github.com/felixrieseberg/windows95'
license=('custom')
depends=('gtk3' 'libxss' 'nss')
provides=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
        "${_pkgname}-${pkgver}-LICENSE.md::${url}/raw/v${pkgver}/LICENSE.md")
sha256sums=('7e4c11f683b58374d2e80e961387865ef11d0ea9bd8e0f3ccbc8012332a85412'
            '29b033609720d6977aaf4f537319ab136fb8b84022a3c847daf2ffca88d8eb20')

package() {
  # package() ref: https://aur.archlinux.org/packages/macintosh.js-bin/
  bsdtar -xvf data.tar.xz -C "${pkgdir}"
	install -d "${pkgdir}/opt/${_pkgname}"
	mv "${pkgdir}/usr/lib/${_pkgname}" "${pkgdir}/opt"
	rm -rf "${pkgdir}/usr/"{lib,share/{doc,lintian}}
	rm -rf "${pkgdir}/opt/${_pkgname}/resources/app/.github"
	rm "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}-${pkgver}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
