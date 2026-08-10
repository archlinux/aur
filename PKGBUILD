# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=westpoint-io
_gitname=lazyrsync
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal UI for rsync — profiles, dry-run diff preview, live progress"

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'rsync')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('67e1a89fe8ba17ee650d8ba4f57115b49ae2c49453deabe5918b4b7bbb283074'
            'd5f42f4a131789a11fd12133dda988199ef9f49bc10180761a72921937219d48')
sha256sums_x86_64=('86e6031f8da85260f35a7c6c80a9dc7991ba077b635b58d2ff4fbe68effabb23')
sha256sums_aarch64=('d3bc82eccde12ecc68fcd88dff2f6e6c25ddfb4db45e846fc6a543f5f35cb24c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
