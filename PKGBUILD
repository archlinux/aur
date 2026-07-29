# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=westpoint-io
_gitname=lazyrsync
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal UI for rsync — profiles, dry-run diff preview, live progress"

pkgver=0.2.0
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
sha256sums=('48e7d6f2af5a67dc5c5b7ff5700003f3f254f0fef383aec220d3b1e869e516ad'
            'd5f42f4a131789a11fd12133dda988199ef9f49bc10180761a72921937219d48')
sha256sums_x86_64=('db6ef05f17166ecfb0aef99a1a5c7954ec5f440553cd97760d476486081d9912')
sha256sums_aarch64=('07a28c26ff3967c88f2d97eb8a3da5623e508462a2cc65b4ecd40acb3851baab')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
