# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_execs=(tmuxpanel tmuxthemes tmuxplugins)
_appname=tmuxpanel
_pkgauthor=marlocarlo
_pkgname=Tmux-Plugin-Panel
pkgname=${_pkgname,,}-bin
pkgdesc="A full-fledged TUI plugin manager for tmux"

pkgver=0.1.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_execs[@]}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_pkgvername}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_pkgvername}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('c040ebdc96991b218297fc2a714a4a151dd900a7bf6ff125155ba254867f46eb')
sha256sums_aarch64=('c040ebdc96991b218297fc2a714a4a151dd900a7bf6ff125155ba254867f46eb')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
	${arch[1]})
		_CARCH="${_barch[1]}"
		;;
	${arch[2]})
		_CARCH="${_barch[2]}"
		;;
esac

package() {
	cd "${srcdir}/${_appname}-${_pkgvername}-${_CARCH}/" || exit

	for exec in ${_execs[@]}; do
		install -Dm755 "${exec}" "${pkgdir}/usr/bin/${exec}"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
