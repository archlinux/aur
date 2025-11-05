# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=tocry
pkgname=${_pkgname}-bin
pkgver=0.26.1
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
            '74b8a99a73e942c04591603b47cdccdf5b5c16a8ae028f7b2f30bb59d498cae5')
sha256sums_x86_64=('f3c10ee87c63e63e1e94688c35212ab550706d7aeed85e01009b645efbe4dfa1')
sha256sums_aarch64=('2331e7f7955c9a4302b30ff825af2c0262d83897aaa67b456f4d9ebacbd102e1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.service" "${pkgdir}/etc/systemd/user/${_pkgname}.service"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
