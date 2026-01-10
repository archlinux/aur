# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com/checkmake/checkmake/releases/download/v0.3.0/checkmake-v0.3.0.linux.amd64
_pkgauthor=checkmake
_pkgname=checkmake
pkgname=${_pkgname}-bin
pkgdesc="Linter/analyzer for Makefiles"

pkgver=0.3.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}.linux.${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}.linux.${_barch[1]}")
sha256sums=('01090018cb293e1a5cb260fba2222468a39f1bf9a8b4c37375d1355f776ef7f9'
            'da7303e05064c979412ab954e9e7cc9e193d731664f0edec74d814b237c59909')
sha256sums_x86_64=('e2effb876913f3ee2caef0ba35f6202c5e8a3cd55a077d8d2b9ce2034257b6af')
sha256sums_aarch64=('409167c4abb99407bd232c3bbd351b8a39df57997feafde5a08bddffb0f2dcb4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
