# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com//code/releases/download/v0.6.15/code-x86_64-unknown-linux-musl.zst

_appname=coder
_pkgauthor=just-every
_pkgname=code
pkgname=${_pkgauthor//-/}-${_pkgname}-bin
pkgdesc="Community-driven fork of the Codex CLI for local terminal coding assistance"

pkgver=0.6.56
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
            '417b2b7cf1cea86067d4b8109793959d8ef34fc65ffeef540118119931c3557b')
sha256sums_x86_64=('5d2c1e0851761f6b5b8eba03998970d73c19ef780d672b24610fc62e26c98daa')
sha256sums_aarch64=('93e301e4d75677eec93d912f4ed5b86fff5906b9500357f686f4560807a40aa0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "code-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
