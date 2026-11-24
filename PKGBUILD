# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=guitmz
_gitname=syscall
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Look up Linux syscalls from your terminal"

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

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('d26f587f036c381a916506090aef59535d5bf0f9e5aa971d5b785b3fa198390b')
sha256sums_aarch64=('d69efc591750bf32ac65f32e2ae080c315a5ec1375780914b82cf2582e15691b')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

package() {
	cd "${srcdir}/${_gitname}_${_gitversion}_${_CARCH}/" || exit

	install -Dm755 ${_appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 dataset/* -t "${pkgdir}/usr/share/${_appname}/dataset/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 THIRD_PARTY_LICENSES.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
