# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=tocry
pkgname=${_pkgname}-bin
pkgver=0.25.0
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
            '2274a9c71895d60d9454e9259a491c28760dc02cac25899105a5d2b980fa5a92')
sha256sums_x86_64=('824b5167c113231ee73766728cca0305aba47311065beca97b05fefbe1cd8d67')
sha256sums_aarch64=('6934ff39a5da4afc148bb4fe8b3477f587bbda94ec60cb9f7a00f2b662e9d027')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.service" "${pkgdir}/etc/systemd/user/${_pkgname}.service"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
