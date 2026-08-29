# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=vincelwt
_gitname=gloomberb
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Finance terminal, in your terminal"

pkgver=0.11.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_gitname}-${arch[0]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.gz")
source_aarch64=("${_gitname}-${arch[1]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}.gz")
sha256sums=('2e510b45f039f9461da63d98cb159a457c001b9012623525ca9940291230e4a4'
            '735bda4a87be6cbfa596f6957866c94838a171ed7e371d6cb59998e60b87f1a7')
sha256sums_x86_64=('8728eb8718713d8b6d9b957cb9512e782f8e36f2d63ed7d17a719116283d9f3b')
sha256sums_aarch64=('dc2ce7dff38cbb995712aa861b6b6e9ca4437a1ef2704c1c7ee410a89e6f7d4b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
