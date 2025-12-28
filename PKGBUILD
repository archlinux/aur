# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=grafito
pkgname=${_pkgname}-bin
pkgver=0.16.1
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
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[1]}")
sha256sums=('811bf1c965009017d9dfc3d6a3a62018fce8c5343ba4a37aa71c248ac255815b'
            '5e12cdb77daa2372d7232dc9ceeec7084f14afee0cf2db28e5ed2df9bb0e1cbf'
            '571079ea2b4337c0c55a3b86a70227c2850e676ad9f7fa750f7cd98f9ad5e9f7'
            'c9f40c3b8687aae3c7d19453021119ad896ed5c1b4bc9aa5c1d2e692ed9dec12')
sha256sums_x86_64=('4b4d0a35fb8041966f9f680b6229e27cb8e8091e151701f735b11271be50cfa1')
sha256sums_aarch64=('28ed2f76e44d9ee6da2147413c0851c7e6befec14559d648987ef78b5591655f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
