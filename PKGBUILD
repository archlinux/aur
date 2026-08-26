# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=zoxy-io
_gitname=zrk
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A constant/linear throughput load generator in Zig ⚡"

pkgver=2.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux' 'aarch64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('a9e7a0b2ca0bb923c316c0cc1b9f60e8407ebbeb974467cea6b808644b5dd611'
            'd2f0e0853027f38ebb850619a0ddab6c1f3c33e3ccdb8c7d6d6bca1b3eb70524')
sha256sums_x86_64=('ab6f1c1ce34ce73f52afd106419d15e5c494bd1cedd475afa56babb85b09a816')
sha256sums_aarch64=('361f2632e3cee672cf6a8676438c9fa93e8a5702a0007bacc266861767bab213')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
