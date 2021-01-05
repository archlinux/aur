# Maintainer: Barfin
# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='windows95'
pkgname="${_pkgname}-electron-bin"
pkgver=2.3.0
pkgrel=1
pkgdesc='Windows 95, running in an Electron app'
arch=('x86_64')
url='https://github.com/felixrieseberg/windows95'
license=('custom')
depends=('gtk3' 'libxss' 'nss')
provides=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
        "${_pkgname}-${pkgver}-LICENSE.md::${url}/raw/v${pkgver}/LICENSE.md")
sha256sums=('d9e7c10235347f27bcaafdf5ff28d5b77d425dfe56c1a530456198dc57a70d1d'
            '29b033609720d6977aaf4f537319ab136fb8b84022a3c847daf2ffca88d8eb20')

package() {
  # package() ref: https://aur.archlinux.org/packages/macintosh.js-bin/
  tar -xvf data.tar.xz -C "${pkgdir}"
	install -d "${pkgdir}/opt/${_pkgname}"
	mv "${pkgdir}/usr/lib/${_pkgname}" "${pkgdir}/opt"
	rm -rf "${pkgdir}/usr/"{lib,share/{doc,lintian}}
	rm -rf "${pkgdir}/opt/${_pkgname}/resources/app/.github"
	rm "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}-${pkgver}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
