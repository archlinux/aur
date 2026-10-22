# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=grafito
pkgname=${_pkgname}-bin
pkgver=1.7.0
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

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
        "SERVICE-${pkgver}.service::${_urlraw}/${_pkgname}.service")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[1]}")
sha256sums=('5e12cdb77daa2372d7232dc9ceeec7084f14afee0cf2db28e5ed2df9bb0e1cbf'
            '601547c7aac7f8d8f6eb951c698d0f9ddcbebf808f905e48b4b83571e8552f8a'
            '8b854624375b2ac398277892b69cfce704a750cae05427ed9b02b604ed2e3bdb'
            '26cdfd5f27ca1c903c0f17347c23cec31acf7ff8828bce66c6a96cc4fcf422f9')
sha256sums_x86_64=('af25d5afd86685167d2b3d9cc04911ca02c54d33ad70ac7378d8f04e27454c5e')
sha256sums_aarch64=('a84e29e2dd8ea4aea4ad9052da835ced9ddab60a682ffbf787c0fd4a6d55edf7')


prepare() {
	cd "${srcdir}/" || exit

	sed -e 's|/usr/local/|/usr/|g' -i "SERVICE-${pkgver}.service"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "SERVICE-${pkgver}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
