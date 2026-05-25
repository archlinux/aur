# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=oxyzenQ
_gitname=zenlixem
_appname=(${_gitname} whoholds envpath lasttouch whyopen)
pkgname=${_appname}-bin
pkgdesc="Linux-focused CLI suite for system introspection"

pkgver=1.0.2
pkgrel=1
_gitversion=v${pkgver}-stable.${pkgrel}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc' 'libgcc')
provides=("${_appname[@]}")
conflicts=("${pkgname%-bin}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('6bfc3047f4233fc85a3d399824f6a7394e602d1f2d16b0b0b093410112c0711e'
            '283e51023305759523c42e545f8027898166a7b8c6f614b24719491bf62217ad')
sha256sums_x86_64=('56cc682d626e1c77be8f83a206c8493080b5fed33b9a23162bfbc5e7c9a0ce01')
sha256sums_aarch64=('afebec5e5be8a963dcdd5b2cc4a86848af05c3f3d834e3fe8accd4870e3916ea')


package() {
	cd "${srcdir}/" || exit

	for app in ${_appname[@]}; do
		install -Dm755 "${app}" "${pkgdir}/usr/bin/${app}"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
