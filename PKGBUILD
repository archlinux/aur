# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=indium114
_gitname=wares
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A declarative AppImage/binary package manager"

pkgver=0.9.4
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
sha256sums_x86_64=('1b4023c6c3a5ba71764fb0271a60cf4c3b65584c68982f127560085076b35098')
sha256sums_aarch64=('6300556ad5b016650765d0cfcb92f907119e539f51c8594372aa59daceacb455')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
