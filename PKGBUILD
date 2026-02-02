# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Erokez0
_pkgname=sweep
pkgname=${_pkgname}-bin
pkgdesc="A flexible minesweeping experience in your terminal emulator"

pkgver=0.2.8
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
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CONFIG-${pkgver}.json::${_urlraw}/config.default.json"
        "SCHEMA-${pkgver}.json::${_urlraw}/config.schema.json")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('220d4501b2be53b547c280d2b3c4864fcdb3a8e6180df18abb626491ebaeaf99'
            '82b1d120d26113860306107fb379ceacbe1b0f818657dddd6ac745508d2dd7c2'
            '73acd9e722a185b7f2947974bd577f47c21379b140ad2e3fdc68444036d2ef03'
            'd7cd8aad3fba2449721a11d8345aa276f825de3d090f5e3c116d666eb4e02a1a')
sha256sums_x86_64=('fdf8a420682dc95b8dcc87488a94ae48ac1a90280aa08fb99cfc60870456a5ed')
sha256sums_aarch64=('bcc38becc4466c601f24a0191956044704b86e7cbc38b7bd22f2c2d555db6b73')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "CONFIG-${pkgver}.json" "${pkgdir}/usr/share/doc/${pkgname}/config/config.default.json"
	install -Dm644 "SCHEMA-${pkgver}.json" "${pkgdir}/usr/share/doc/${pkgname}/config/config.schema.json"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
