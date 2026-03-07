# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=app
_pkgauthor=joaoheitorgarcia
_pkgname=Mezzotone
_execname=${_pkgname,,}
pkgname=${_execname}-bin
pkgdesc="A terminal UI (TUI) application written in Go that converts images and GIFs into ASCII or Unicode art"

pkgver=1.1.1
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
sha256sums=('a839a28b32d72bc2afe398a98545ff99eb6d2d9b306eb8cbe87748fd7742b7c2'
            '52d2fee59711a3373bea27d637831b5ab234443d3cf1d68ec076a37d0ed3c333')
sha256sums_x86_64=('c963377ccb221790af87f54f3c7f9400f536b8af4b631ad5fa872d1ff78e613d')
sha256sums_aarch64=('1ae0c73705d0278d3bfa9061c6cf5ad66182910f7dc3fb45c82223643284f7e3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_execname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
