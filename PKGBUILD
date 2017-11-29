# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

_extname=languagetool
pkgname=openoffice-extension-${_extname}
pkgver=3.9
pkgrel=1
pkgdesc="An Open Source proof­reading soft­ware for English, French, German, Polish, and more than 20 other languages (Apache OpenOffice extension)"
arch=("any")
url="https://languagetool.org"
license=("LGPL2.1")
groups=("openoffice-extensions")
depends=('openoffice' 'java-runtime>=8')
makedepends=('maven' 'unzip' 'java-environment>=8')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/languagetool-org/languagetool/archive/v${pkgver}.tar.gz")
sha256sums=('3b2ddd3be1b139473846679caeba6a64b0a7a2e0fc116614337b2bb01b3c344b')

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
