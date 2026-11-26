# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=martintrojer
_gitname=vtmux
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Drop-in tmux replacement. Modern stack. Better rendering. Live upgrades."

pkgver=3.8
pkgrel=3
_gitversion=v${pkgver}-rc${pkgrel}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('ISC')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('d1b6d39271dbbdbfae19775f1b4ffa42db867fe56db3d40ded7d47450372d07e')
sha256sums_aarch64=('e4476cb42d177640b39eaa9f9c847b4e2f77b557a7cdf2f1e0a74be0eb0645c4')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

package() {
	cd "${srcdir}/${_gitname}-${_gitversion}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
