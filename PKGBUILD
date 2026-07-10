# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=gnomeria
_gitname=usbtree
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Cross-platform TUI for inspecting the USB device tree"

pkgver=0.0.8
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
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('7733acd8a93098eb7f244c1c1b34efb9ff5fded45d1b7d3e3c65d7893c3b1d1b'
            '9be541594ab169eaf1bb278300d81a1fe2bf399980ca2505e978a225ba9d8e0e')
sha256sums_x86_64=('7ada0444cbd40b2a3165bab2a4eba732821b2d45b897b25616d425f665f280c8')
sha256sums_aarch64=('86a6e0a68ca0bbbbe283bf63f4528f8ff6eb4a1a6ed69481996959fb29c22e18')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
