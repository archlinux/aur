# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=neboto
_gitname=neboto-tui
_appname=${_gitname%-tui}
pkgname=${_appname}-bin
pkgdesc="A fast, keyboard-driven terminal UI for browsing AWS"

pkgver=0.14.0
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
sha256sums_x86_64=('7a52934301a78f5559b0566232a7ebdaaa7868764bb0856e1a5ed56e0c998e6f')
sha256sums_aarch64=('2fffea178c48b691d881b942a9e2a62ef870b7f1a13e4077816efd58d9ad9f97')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "config.example.toml" -t "${pkgdir}/usr/share/doc/${pkgname}/config/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
