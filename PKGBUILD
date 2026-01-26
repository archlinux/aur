# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com//code/releases/download/v0.6.15/code-x86_64-unknown-linux-musl.zst

_appname=coder
_pkgauthor=just-every
_pkgname=code
pkgname=${_pkgauthor//-/}-${_pkgname}-bin
pkgdesc="Community-driven fork of the Codex CLI for local terminal coding assistance"

pkgver=0.6.51
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
sha256sums_x86_64=('266add8363b4531fcb33ba91a214140b220fc02a350bb3a721f5c31f691e7000')
sha256sums_aarch64=('49f98129f4499db686fb72f0310b9423353f9f642112cd09ad999c4f77deeb26')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "code-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
