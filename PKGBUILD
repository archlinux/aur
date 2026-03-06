# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=app
_pkgauthor=joaoheitorgarcia
_pkgname=Mezzotone
_execname=${_pkgname,,}
pkgname=${_execname}-bin
pkgdesc="A terminal UI (TUI) application written in Go that converts images and GIFs into ASCII or Unicode art"

pkgver=1.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_execname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_execname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}")
source_aarch64=("${_execname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}")
sha256sums=('01025303c092b175f459fbf7b850e423a52d1d730e1b0db4cc87ce3ca71f5ac3'
            '52d2fee59711a3373bea27d637831b5ab234443d3cf1d68ec076a37d0ed3c333')
sha256sums_x86_64=('116c9114dc460c72d79caec96bdfeae123f949c2b98899a3309baadeb45f0839')
sha256sums_aarch64=('00b9de00f3afc8390a0bbacf53a59fbabefdccb0082499986e2642cc41f7e8e3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_execname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
