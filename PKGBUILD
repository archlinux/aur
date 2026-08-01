# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=stojanovic
_gitname=hawkshaw
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A focused, fullscreen, side-by-side terminal git review tool"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'zlib' 'git')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('777e84e012f991961c9b2a3daa90d0f16b2188a8a8890a2aab795f8696aa1011'
            'ab177ef5cb114057452a92c3dd0613fa0017dcef1371c1283d8ec271488262c2')
sha256sums_x86_64=('c1e86d9da03f046ea44041c8dd02b51fac66ed210cc32dfc2f3f5793c452e0ba')
sha256sums_aarch64=('e59d62dec564e05c124668127ec75cf012de7522244c48243fc64cbb21de2746')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
