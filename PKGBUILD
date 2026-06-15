# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Drackrath
_gitname=Aurelia
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A fast, lightweight, command-line Steam launcher and library manager written in Rust"

pkgver=0.1.8
pkgrel=2
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_x86_64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'xz' 'bzip2' 'openssl')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"USAGE-${pkgver}.md::${_ghurlraw}/USAGE.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
sha256sums=('47fe9ab365c80f103699f612607d034b2c8ecf84fadf7e36e518c92feffe9eed'
            '2da069fa05232a1e5f65ec28a9e56483cdf91898f069d189d7e1b3ad9140ed11'
            'f2be9195b5ecdd8f2b71db80d4794361f90a2bdb91894f3c811f025c6578db5b')
sha256sums_x86_64=('274756ad4482970c34ebce521c41928891743c019a1b6ef0f3f204c015ea541e')
sha256sums_aarch64=('5886daf0cd3d205a420a6263579f14a3ecf87a056a6f5f661e969761b817c09c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "USAGE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
