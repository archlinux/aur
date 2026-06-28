# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=SagarMaheshwary
_gitname=reqlog-ui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A lightweight web UI for reqlog — search and trace logs directly from your browser"

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

depends=('glibc' 'reqlog')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/readme.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('6758091e3bc84c2db919836e32d370f5b4bdaae8568a0d96f30f251a7b4b54c6'
            'a48f5e717b8c3981015ab444bdb56d9dd1e79b0657674b31ab45cef12e35f15d')
sha256sums_x86_64=('fc3e70711d6edac49a1aa14389b58671ef6588540b9c0c84ac20223cc1c32354')
sha256sums_aarch64=('2697575592591f08c3baa6d23e9990331ead2cfd2d5db60028be6a8da363aab5')


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
