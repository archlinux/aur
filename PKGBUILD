# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=neboto
_gitname=neboto-tui
_appname=${_gitname%-tui}
pkgname=${_appname}-bin
pkgdesc="A fast, keyboard-driven terminal UI for browsing AWS"

pkgver=0.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')
optdepends=('aws-cli' 'aws-session-manager-plugin')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('16b5194379b8188eee4bdd59f60d5c42b25b1feb26327ff3172be813be1a7883')
sha256sums_aarch64=('2a0d9244b1b274d51a60d50f2a8f8abf562442f02bc77baee98e6d511b09e354')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "config.example.toml" -t "${pkgdir}/usr/share/doc/${pkgname}/config/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
