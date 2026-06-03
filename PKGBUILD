# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=SagarMaheshwary
_gitname=reqlog-ui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A lightweight web UI for reqlog — search and trace logs directly from your browser"

pkgver=0.4.0
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
sha256sums=('fddf1c93fe658c7bf873dda8fcfd6de94f4fc8abfd7e1e25987946ae70958429'
            'a48f5e717b8c3981015ab444bdb56d9dd1e79b0657674b31ab45cef12e35f15d')
sha256sums_x86_64=('fdad489605344284ad337cb583291aeefe4bd95d2ed99f6cab933e7047a835ec')
sha256sums_aarch64=('568365a4941158542b33880d75a06e6252ca687a2f9bad186e0549855e6049a2')


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
