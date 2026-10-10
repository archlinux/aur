# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=neboto
_gitname=neboto-tui
_appname=${_gitname%-tui}
pkgname=${_appname}-bin
pkgdesc="A fast, keyboard-driven terminal UI for browsing AWS"

pkgver=0.4.0
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
sha256sums_x86_64=('b3dabfec3520d1fbc1c05a8d52e89e7e099fd8c1f23dac6327ca2d61dbb896cb')
sha256sums_aarch64=('b25a9881b703606d4df45b3bfe316e3deda3c990d6cae57db5aef624b8b9917f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "config.example.toml" -t "${pkgdir}/usr/share/doc/${pkgname}/config/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
