# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=parsaenami
_gitname=taskii
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal dashboard for tasks, notes, and focus, built with Go and Bubble Tea"

pkgver=0.5.0
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
sha256sums=('55bcb8562d1d3d68a5a777e8c45ff26c7d21682a7427ea22c345cdd2d0938749'
            '026b8f2966d49364a239f972cd761fbc32a0cd456c0811611d2233dc9c730512')
sha256sums_x86_64=('96dd197e0711830a84cee78cfdcdce725e4a290f68c6900ee0e7eca592a72270')
sha256sums_aarch64=('d395775b8af7dad8e01fce215a7bc76a378100cb406bdd5a3c5a234426658591')


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
