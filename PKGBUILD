# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=noturbob
_gitname=slat
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal multiplexer with tiling panes, tabs and workspaces that keep running after you close the window"

pkgver=1.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('9fa515edded3680088e15adaab6bc71dce18b1b073dd17acaca32ac446bcdf6f')
sha256sums_aarch64=('cf5b934ff7691c3821a634c7f509498e0f4e6bc6958069a9ffb1a1b9030a29ad')


package() {
	cd "${srcdir}/"

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "${_appname}.1" -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 "config.example.toml" -t "${pkgdir}/usr/share/doc/${pkgname}/config/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
