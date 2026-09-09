# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=shellroute
_gitname=shellroute-cli
_appname=${_gitname%-cli}
pkgname=${_gitname}-bin
pkgdesc="A proxied shell for terminal workflows. Open a session and run commands through a proxy."

pkgver=0.1.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

depends=('zsh')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('cd6c7afc863d1b78b493cb1af8c2cdd38351be17e19de26f0e9f97b790e591af')
sha256sums_x86_64=('acf57be100da622f714d6755c470fb42472497d48ca327dace25238c79da1fad')
sha256sums_aarch64=('8bb2579ef9e8cc5f28396512be4205a2422f5ee662ef4869ec6731da994d6d09')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
