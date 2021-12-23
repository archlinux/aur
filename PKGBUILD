# Maintainer: taotieren <admin@taotieren.com>

pkgname=asciidoctor-web-pdf
pkgver=v1.0.0_alpha.14
_pkgver=${pkgver/_/-}
pkgrel=2
pkgdesc="A PDF converter for AsciiDoc based on web technologies. It allows complex layouts to be defined with CSS and JavaScript, while writing the content in AsciiDoc."
arch=('any')
url="https://github.com/Mogztter/asciidoctor-web-pdf"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname}  ${pkgname}-git)
#replaces=(${pkgname})
depends=('npm' 'poppler' 'ghostscript')
makedepends=()
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}-${_pkgver}.tar.gz::https://ghproxy.com/${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('20914817964e927f13cb7feb36318aba18b160083515e21c58dcbcde16762520')
noextract=("${pkgname}-${_pkgver}.tar.gz")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_pkgver}.tar.gz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
