# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=praetorian-inc
_gitname=titus
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="High-performance secrets scanner with 400+ detection rules with live credential validation"

pkgver=1.2.11
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}")
sha256sums=('03a748fcd309445d8f14629c1a1a02e3b7774be66418fe6a0eefac651b553142'
            'c79772859956ceea1389d4f13fc6791d66cf67057cdfda13e137f7e4fe1e5b08')
sha256sums_x86_64=('c3c5bc8dccdc59cc1583384b28bf9d85c9fb93f7f758e665440e7d296dac351b')
sha256sums_aarch64=('2df5b75765b933f3f4a5f8c882437914cb9932c82cfe4266f4a65e481fdcd0aa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
