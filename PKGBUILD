# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=pierinho13
_gitname=cmdpeek
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Searchable interactive command palette for discovering, previewing and running reusable terminal workflows from YAML"

pkgver=0.0.21
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
sha256sums_x86_64=('41b8b5f0fd3c0c68c309e75dd0fccfedc72498bc058bed9397ddb25377022602')
sha256sums_aarch64=('2c5c8a730caee4701cef0d8c70d1bcccce444c7e81eb8f0371f413da1e111c63')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "CONFIG-${pkgver}.yaml" "${pkgdir}/usr/share/${_appname}/examples/commands.yaml"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
