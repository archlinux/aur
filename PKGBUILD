# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=excelano
_gitname=ved
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="The verbose ed — a drop-in compatible ed clone with friendly errors, written in pure-stdlib Rust"

pkgver=0.4.1
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
sha256sums=('cb73ae23cc8169c7eb1045f027e18311d11925ce950901abec6949024b899de1'
            '3f497ab835deeb8c179da91c333f2e0be83b27bf1d2dadcc76a625f6c8da8405')
sha256sums_x86_64=('50e473852965a9dd7d768dc4ba59dd80960c796fd84a3fdbe7eb4530ba9c2f70')
sha256sums_aarch64=('88bdb5cc2fba6921d4e7c91a6aec44a4df00d30245e01eba8af42b18b4e12c96')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xvf "${srcdir}/data.tar.xz" --exclude="usr/share/doc"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
