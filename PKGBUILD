# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=tocry
pkgname=${_pkgname}-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="A TODO app "
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
sha256sums=('518dc937443f7b87751b691d7ba2760632a3e8c70c894970db0c7bb091838c06'
            '5e12cdb77daa2372d7232dc9ceeec7084f14afee0cf2db28e5ed2df9bb0e1cbf'
            '322fc6700985541c381870eba5eb6bfb7a1ac86cab6c5ca21647d37a7fa17746'
            '088d3196a8e3d52e5f2d21dde61cbbbc4c3ddc478c341b029deeffd040ee3a2a')
sha256sums_x86_64=('9b84fafb835c5d8384946e25a39d65feade99b920a3052f9ab4fd7319f758247')
sha256sums_aarch64=('4828378e234d4827bb0f69e8462a0c1acf9af090a7af089b8bb7cb1bb1dc0a76')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.service" "${pkgdir}/etc/systemd/user/${_pkgname}.service"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
