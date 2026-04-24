# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-Maintainer: FLOZz <aru at flogisoft dot com>
pkgname=rst2gemtext
pkgver=0.6.0
pkgrel=1
pkgdesc="Converts reStructuredText to Gemtext (Gemini markup format)"
arch=('any')
url="https://github.com/flozz/rst2gemtext"
license=('GPL-3.0-or-later')
depends=(
    'python>=3.10'
    'python-docutils'
    'python-pygments'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-flit-core'
    'python-wheel'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
)
sha256sums=('8b055d79677e6dd0cd841924023c59976219ee09c8f9ee03905ce194dbddc262')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}