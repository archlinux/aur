# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=hace
pkgname=${_pkgname}-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="A task-launching app (think make)"
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
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[1]}")
sha256sums=('e50dacbce1f6e8737ee91f43aa0b3a322aabda7e15ea0011b4059cb51dc9a274'
            '728e6d1676e431bd698cd0dea91309a6d7bb0388d5b07ba1a67cba19ffbd3e36'
            'c9ade2ded03325c0332e43e806fab52f2c350e85043eaa8dc71275b87cb32617')
sha256sums_x86_64=('6233ebd323fa5aad6eb61bbd457803ca7eb8af7fd6c6f5001b27f28dc9fae2c3')
sha256sums_aarch64=('d7c94c46fd39d5c22c74ded04acd3f52abb5ce1a781b3e387c17128081c15bfb')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
