# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_execs=(tmuxpanel tmuxthemes tmuxplugins)
_appname=tmuxpanel
_pkgauthor=marlocarlo
_pkgname=Tmux-Plugin-Panel
pkgname=${_pkgname,,}-bin
pkgdesc="A full-fledged TUI plugin manager for tmux"

pkgver=0.2.0
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
sha256sums_x86_64=('675a377d1533b613a1a0150cbdbac5f19f77b661afeca937aaaf30a39c09a345')
sha256sums_aarch64=('675a377d1533b613a1a0150cbdbac5f19f77b661afeca937aaaf30a39c09a345')


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
