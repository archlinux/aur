# Maintainer: taotieren <admin@taotieren.com>

pkgname=drawnix
_tagname=0.4.1
pkgver=${_tagname//-/_}
pkgrel=1
pkgdesc="All in one open-source whiteboard tool with mind, flowchart, freehand and etc."
arch=('any')
url="https://github.com/plait-board/drawnix"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    sh
    perl
    python
    python-fonttools
    nodejs
)
makedepends=(
    npm
    poppler
    ghostscript
)
backup=()
options=()
install=
source=("${pkgname}-${_tagname}.tar.gz::${url}/archive/refs/tags/v${_tagname}.tar.gz")
sha256sums=('f82fe42c8c5770037bdd7edb86e566ea965df46c14a927d20ae381b30693d7b9')
noextract=("${_pkgname}-${_tagname}.tar.gz")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_tagname}.tar.gz"   

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    install -Dm0644 "${srcdir}/${pkgname}-${_tagname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
