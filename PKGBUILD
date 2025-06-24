# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-svg2tikz'
pkgname=('python-svg2tikz')
_module='svg2tikz'
pkgver='3.3.2'
pkgrel=1
pkgdesc="Tools for converting SVG graphics to TikZ/PGF code"
url="http://xyz2tex.github.io/svg2tikz/"
depends=('python')
optdepends=('python-inkex' 'python-lxml' 'xclip')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-poetry')
provides=("svg2tikz=${pkgver}")
conflicts=("svg2tikz-git")
license=('custom:Other/Proprietary License')
arch=('any')
source=("https://github.com/xyz2tex/${_module}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e9754c38dd78ce142e83eb3779e71686b1b22ab54e4d7953224279c7f578bc15')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -m755 -Dt "${pkgdir}/usr/share/inkscape/extensions" ${_module}/*.py
    install -m644 -Dt "${pkgdir}/usr/share/inkscape/extensions" ${_module}/*.inx
}
