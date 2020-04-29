# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=i18n-editor
_author=jcbvm
pkgname=("${_gitname}")
pkgver=2.0.0
_pkgver=2.0.0-beta.1
pkgrel=1
pkgdesc='GUI for editing your i18n translation files'
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('MIT')
depends=('java-runtime')
makedepends=('java-environment=8' 'maven')
provides=("${_gitname}")
conflicts=("${_gitname}-git")
source=("https://github.com/jcbvm/i18n-editor/archive/${_pkgver}.tar.gz"
        "${pkgname}.sh"
	"${pkgname}.desktop")
sha256sums=(
'0d8c14f2613a698b64b782f9c3ec84878f5e233bbbf2ad1bec487e01ec9bf320'
'ba98cfc5a6e58b57415e310eeea3bf0da193cd8fa792e09c80bbcf16aaa87075'
'90e2eefcee0f7f6241231eb2d3c3763ba8a2514fd732411784c5bc924d3ff18a'
)

build() {
	cd "${srcdir}"
	cd "${pkgname}-${_pkgver}"

	mvn install
}

package() {
	install -m755 -d "${pkgdir}/usr/bin" \
	                 "${pkgdir}/usr/share/java/${pkgname}/"  \
			  "${pkgdir}/usr/share/applications/"

	cd "${srcdir}"

	install -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	install -m755 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	cd "${pkgname}-${_pkgver}"

	install -m644 "target/${pkgname}-${_pkgver}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/"
}
