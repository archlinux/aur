# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=grafito
pkgname=${_pkgname}-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A linux logs web frontend"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("${_pkgname}.service"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[1]}")
sha256sums=('811bf1c965009017d9dfc3d6a3a62018fce8c5343ba4a37aa71c248ac255815b'
            '5e12cdb77daa2372d7232dc9ceeec7084f14afee0cf2db28e5ed2df9bb0e1cbf'
            '32b9991bd31a4640bb69b49d2235fbfba3436247fa07524f40a05a6fbb9aa0ab'
            '0293948111a8bb8817a0da15ac1a6283b0d03a968c00d0e6e5eff82af45e0fb4')
sha256sums_x86_64=('780452da26c806c8c0a327ca5d07fe8f2b548dd6534229f749e133bd1d0d28a3')
sha256sums_aarch64=('c0c287cc7c380b3919e7262d2ec90fb4465e7c50c96bfa35b3340a3cc5d22278')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
