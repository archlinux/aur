# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=parsaenami
_gitname=taskii
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal dashboard for tasks, notes, and focus, built with Go and Bubble Tea"

pkgver=0.2.3
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
sha256sums=('60c4593f22d4f1b48e309e0da7819bf8f7f7852f1faceace37262c7b7dd9a3fc'
            '026b8f2966d49364a239f972cd761fbc32a0cd456c0811611d2233dc9c730512')
sha256sums_x86_64=('cef4c8cd51fa7ef65477efbfb0dca3f4be3e77d88986a89028e902b58b0e83e1')
sha256sums_aarch64=('9bfb4e2c8ac92d332b46e0157f4629e2ca31c2f623a93bc23bba8c33b0913243')


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
