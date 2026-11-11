# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=excelano
_gitname=ved
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="The verbose ed — a drop-in compatible ed clone with friendly errors, written in pure-stdlib Rust"

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}-${pkgrel}_${_barch[0]}.deb")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}-${pkgrel}_${_barch[1]}.deb")
sha256sums=('5143564c65e6703021dd682d38971bdf776b6413f4d896db39653f03ef6d616f'
            '3f497ab835deeb8c179da91c333f2e0be83b27bf1d2dadcc76a625f6c8da8405')
sha256sums_x86_64=('16e3362afcbf753b403bc23304b7f1d2c85b80dfb5022ceceb4e94e54243faa3')
sha256sums_aarch64=('edbac4956b777ba9f1b2d678a7ce22f0b157bc9e6abdaab020e567c443af839b')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xvf "${srcdir}/data.tar.xz" --exclude="usr/share/doc"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
