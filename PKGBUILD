# Maintainer: taotieren <admin@taotieren.com>

pkgname=asciidoctor-web-pdf
pkgver=1.0.0_alpha.16
_pkgver=${pkgver/_/-}
pkgrel=0
pkgdesc="A PDF converter for AsciiDoc based on web technologies. It allows complex layouts to be defined with CSS and JavaScript, while writing the content in AsciiDoc."
arch=('any')
url="https://github.com/Mogztter/asciidoctor-web-pdf"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname}  ${pkgname}-git)
replaces=()
depends=('npm' 'poppler' 'ghostscript')
makedepends=()
backup=()
options=()
install=
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('d19863999545af3e7adfef1630c045058e4751134e03eda93fdecd6377366ef2')
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
