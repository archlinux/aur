# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=kyu08
_gitname=fzf-make
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A command line tool that executes make target using fuzzy finder with preview window"

pkgver=0.75.0
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

depends=('glibc' 'libgcc' 'fzf' 'make')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[1]}.tar.gz")
sha256sums=('fd9c0927d453a4c209c07955a30a05b186098246d6383fd0e67b2d1b022e9775'
            '3a45867c41a5980fc038e1c2fc7e5e33b4de05c3dc4f72efbc7821f523e4a6f5')
sha256sums_x86_64=('d7008dc9a9f25c1a3bb393ed94c64e697cba1afa6648a776849b2125342554a7')
sha256sums_aarch64=('879f27a672a68ba36e177d4041f77901b65da52e462f95e4d6d01d663de485a8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
