# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=pierinho13
_gitname=cmdpeek
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Searchable interactive command palette for discovering, previewing and running reusable terminal workflows from YAML"

pkgver=0.0.20
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('Linux_amd64' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("CONFIG-${pkgver}.yaml::${_ghurlraw}/examples/basic.yaml")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('6166d5cee112b3960477dd186e448a1802288322045e005576aa96e29056a468')
sha256sums_x86_64=('9c4dd4ad1103acba70060c021f02dbc05d753db4823010eb42ab6997d0727e62')
sha256sums_aarch64=('0b8af672569f6ee190c8d3602883535d7ea6f566446a237684fe0c9e405b4a3e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "CONFIG-${pkgver}.yaml" "${pkgdir}/usr/share/${_appname}/examples/commands.yaml"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
