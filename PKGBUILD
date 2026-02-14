# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cbrunnkvist
_pkgname=ttylag
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="Simulate laggy SSH, flaky 3G, or 9600 baud serial links for local terminal apps"

pkgver=0.1.5
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('Linux_x86_64' 'Linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}.tar.gz")
sha256sums=('75a42de1167a9423a25c67271322d6e7c501a4625c2e52974e33ac44451284d0'
            '0a0bd1ea5cd1c5d7ca7bdefa9b065569ba5a956334d90f7aa4e097f8cc023a03')
sha256sums_x86_64=('1a0edb29318c7cebd32e882867c3d7879d52f40c95dda7c35c9eedd2c05d04c6')
sha256sums_aarch64=('6dd79e59395d4f669cf40f49aafe82027ec0505eafc315067a2dc21dc28e6573')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "${_appname}.1" -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
