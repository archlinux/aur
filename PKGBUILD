# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com//code/releases/download/v0.6.15/code-x86_64-unknown-linux-musl.zst

_appname=coder
_pkgauthor=just-every
_pkgname=code
pkgname=${_pkgauthor//-/}-${_pkgname}-bin
pkgdesc="Community-driven fork of the Codex CLI for local terminal coding assistance"

pkgver=0.6.173
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zst::${url}/releases/download/${_pkgvername}/code-${_barch[0]}-unknown-linux-musl.zst")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.zst::${url}/releases/download/${_pkgvername}/code-${_barch[1]}-unknown-linux-musl.zst")
sha256sums=('d17f227e4df5da1600391338865ce0f3055211760a36688f816941d58232d8dc'
            '843a4f6097631ed061841596386c596722520827e962d5e4c8a886e6051ab7da')
sha256sums_x86_64=('7287c8f9492582446e6f5191c2a26a2e82eee5f4c2aa43f6ea984d28db166d7f')
sha256sums_aarch64=('c465e499052f74abb2751beab6bb2e576e6ca255db4e8fc9d4e684a9e0fa9339')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "code-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
