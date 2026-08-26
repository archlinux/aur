# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=jeppeklh
_gitname=switchlet
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A small terminal app for switching project configuration profiles safely"

pkgver=0.20.10
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
sha256sums=('11bc4775ef2a59e7ab0a066f8d4b978e70f57b2ced7cfa8025537210925b29af'
            '7169fd4fb7b754a22701ad3978931c994ad97c1ce46cba85cdb1cb69238f9bd1')
sha256sums_x86_64=('673f07b7cf5292262189a9f7fcae9b0b916c6a50933e8862419b6700d01967e9')
sha256sums_aarch64=('87376415589379baffec413e8f344a3d0eab25ce183c900ed7c22e5f5707c2e7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
