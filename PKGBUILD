# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=indium114
_gitname=wares
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A declarative AppImage/binary package manager"

pkgver=0.9.5
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('Linux_x86_64' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
sha256sums=('7170d4785755f503c7cbbc3719060263e025f57c377a50c94206b23504ae4b82'
            'c1818149b60d0cc6e49438054e61c4d63e44aed0351d0680b39260271ce8b8e6')
sha256sums_x86_64=('29b518b1c57337d3f2dde3e2c99bac2bfaeabe66a554ef35a16816bc97e78a5c')
sha256sums_aarch64=('eaee62baff0f28a064de92638f76badff9f0e02672ff66114dbaf461a08bf39e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
