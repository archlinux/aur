# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yetidevworks
_gitname=bosun
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Tmux-native orchestrator for AI agent sessions"

pkgver=2.2.13
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('tmux')
provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('e787167ee71b9c37e3353c09bb211d137878615a11cdf7706819e8284874c6f9'
            'c13c90e64ceabc5dfe6450da43bb2479cd026feed99338bff3391677c65e1c6a')
sha256sums_x86_64=('71b510a00caee7c0a75583ba85f3b70cd7bb8f39881972f40f7e6e1f8f0bee01')
sha256sums_aarch64=('3cf04755d6b94eee04f3d5e82e1c1728aca49eb1750b1ed9e306a3160d4a564b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
