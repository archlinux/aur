# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=joewalnes
_gitname=pq
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Inspect, query, transform, and view Parquet files from the command line"

pkgver=2026.04.12
pkgrel=1
_gitversion=latest

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('a4de52779f23fe9ccb7ce85efa50853399b0b3bbd9d980791fd5fceac5fa1eab'
            '6e84842560bd74d9730631d2e82dc254a6abd965a99a29535866e2108bd31b9f')
sha256sums_x86_64=('a1575a78952e5f2c853f65a7be29701741386f94c401be43c40920f2224c0488')
sha256sums_aarch64=('1880ff4b37c9aedd9b4cf689cfd70027425be0327b4ca2e983162a0662ff9b2a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
