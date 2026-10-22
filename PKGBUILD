# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=westpoint-io
_gitname=lazyrsync
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal UI for rsync — profiles, dry-run diff preview, live progress"

pkgver=0.4.0
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
sha256sums=('41f65b7d3c48c7889266efa75784b004fc0c374b424ae885f17a9a03206fd999'
            'd5f42f4a131789a11fd12133dda988199ef9f49bc10180761a72921937219d48')
sha256sums_x86_64=('0cd33c252f3fddc6fd95a1350c80271cbcdcc6cb340469d573fc8560b86f3adc')
sha256sums_aarch64=('be09445c8a3773827e59a896ab9f19b3c17bce57e37f088069c498d99fb188d3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
