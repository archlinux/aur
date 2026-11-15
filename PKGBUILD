# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=rcieri
_gitname=glab-tui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal user interface (TUI) for GitLab/GitHub, built on top of glab/gh."

pkgver=0.9.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64-musl' 'linux-arm64-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('github-cli' 'glab')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('6fd6d38c655d365d85dd8a1f7a48542ad8b4e62afe9e699e3d1b0d17ccb9b43b'
            '2c646a32a456e9806f205883e28aaaef78bc308ddad1f7e15ab9874753bbe203')
sha256sums_x86_64=('9a10a8225f3f16d866047a3f304b1161143f81a0d50097ccc7e99c9a8002b869')
sha256sums_aarch64=('0ea9102af7a2135f4fc252613a897ae92f6c0983b2e05f6a77e51063adca7345')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
