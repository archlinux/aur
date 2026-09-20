# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=thanhphuchuynh
_gitname=lazycomd
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="One daemon for every long-running command"

pkgver=0.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
sha256sums=('6805c6e18c1884f57ba927b72ea14befc09a22a916615e982cf2c15157d48079')
sha256sums_x86_64=('ad7aecbeae77cafc15bb9dadb75c3ae38f2fafde4b4db93e3d06a0a021b11421')
sha256sums_aarch64=('326ec09147fe392c8a91cf24f6fb2e519d07dc0e0a512ac781ace165f3305734')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
