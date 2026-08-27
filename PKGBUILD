# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=miklosn
_gitname=cmdperf
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Command Performance Benchmarking"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('Linux_x86_64' 'Linux_i386' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_i686=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[2]}")
sha256sums=('094681da59bed0a8af70351bbf278f6896cacc0468e09a9c278fa8fcc7db681b'
            'efbb8ac2654e795919ecd8b069f240983ae7bee66adc4ba6b81eafae4caa0f19')
sha256sums_x86_64=('7ceeae07e359a2e40beb47a029f81d19e62cf41390e1de6a0473b8090cc240e2')
sha256sums_i686=('404386a8304c6c5b11350de2007fc9dd6ffa4df6c77f5681b07f74a023117722')
sha256sums_aarch64=('7f99b153e153e20bd7271c016458484a98c3758a53939a1a7ad9ea79d71a7a79')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
