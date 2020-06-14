# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

_extname=languagetool
pkgname=openoffice-extension-${_extname}
pkgver=4.9.1
pkgrel=1
pkgdesc="An Open Source proof­reading soft­ware for English, French, German, Polish, and more than 20 other languages (Apache OpenOffice extension)"
arch=("any")
url="https://languagetool.org"
license=("LGPL2.1")
groups=("openoffice-extensions")
depends=('openoffice' 'java-runtime>=8')
makedepends=('maven' 'unzip' 'java-environment>=8')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/languagetool-org/languagetool/archive/v${pkgver}.tar.gz")
sha256sums=('3e2e54e2ebc28ad9742f9274a31a591907c0f28671143e56cd059d40c4d9e581')

build() {
    cd "${srcdir}/${_extname}-${pkgver}/"

    mvn --projects languagetool-office-extension --also-make package -DskipTests
}

package() {
    cd "${srcdir}/${_extname}-${pkgver}/${_extname}-office-extension/target/"

    _destdir="${pkgdir}/opt/openoffice4/share/extensions/${_extname}"

    install -dm755 "${_destdir}"
    unzip -q "LanguageTool-${pkgver}.zip" -d "${_destdir}"
    chmod -R g-w,o-w "${_destdir}"
}
