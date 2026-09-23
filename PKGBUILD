# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=noturbob
_gitname=slat
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal multiplexer with tiling panes, tabs and workspaces that keep running after you close the window"

pkgver=0.2.1
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
sha256sums_x86_64=('5fde39e26fe31ddae5693261a53912275ab430f6d2d3fe37e4676b67167aca56')
sha256sums_aarch64=('eecd08fceb98de931294e02eaefef717f3d8ce14f7ad2112bd9d6259f70cb3af')


package() {
	cd "${srcdir}/"

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "${_appname}.1" -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 "config.example.toml" -t "${pkgdir}/usr/share/doc/${pkgname}/config/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
