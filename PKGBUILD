# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=parsaenami
_gitname=taskii
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal dashboard for tasks, notes, and focus, built with Go and Bubble Tea"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('54798ca3b9fe08ce53218f5163255954d48c2c682065a00e287e51ea60e18a49'
            '026b8f2966d49364a239f972cd761fbc32a0cd456c0811611d2233dc9c730512')
sha256sums_x86_64=('aa380a04fd9c0e5258402ffa1493fc93eab08342437fbf217cc97becd2076f2f')
sha256sums_aarch64=('8c7862178beaa4958e48cd3958dcfc383b53e45fb7be4705bbc0ed03ca007d99')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
