# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=arvingarciabtw
_gitname=ditto
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A system-wide ASCII keyboard visualizer in the terminal"

pkgver=1.3.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux_amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')

provides=("${_appname}")
conflicts=("${pkgname%%-bin}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
sha256sums=('2adb3649aff6005ca0e7982f4672fb16c71984f9f4158772d25c92b44efbaeb2'
            '9a383b4bb76f67a545bae3818eb5de5415a83bded18d3dbd43483066f7dd429d')
sha256sums_x86_64=('90124cb8518380332af674fd32d446b0abec5fc38b7d0fa84e06bcbe700d1131')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}_${_CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
