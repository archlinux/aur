# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nickprotop
_gitname=lazydotide
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A lightweight console-based .NET IDE with LSP IntelliSense, built-in terminal, and git integration"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'libstdc++')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('662c83fad4bc331f632948cf56f4c06f2993e825d946a0325dba62be80a7459a'
            'dd9eeb7fbd91f48147f181650bf8751228ff67c0fb5ddb2d09ed132280791f4f')
sha256sums_x86_64=('da97fb9e3952d0f1a6cfa35e75d73c66d09d017390ca0a7e75f5948ab2720045')
sha256sums_aarch64=('2f5f6c3417431d4d9c221c5bce51732785a99b460bb61b3ed08022196673d87e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
