# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=lusingander
_gitname=puu
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Render JSON Schema for humans"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('21811d3977c007c991a3d243606015344e21da45565b8948471026007ae0697f'
            '3b607b61bbba8e9b3bd2528080993dc454268b7b3c185ae98d02057ac5ddcc3f')
sha256sums_x86_64=('272e536d8bfbc6dbef0641b293238ccbf48458a22155f8671b71536a122d63b3')
sha256sums_aarch64=('f0c249cabd6128fac47b977196c2ac2b6728ccd32a9882ce6afed07d66a0972b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
