# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-svg2tikz'
pkgname=('python-svg2tikz')
_module='svg2tikz'
pkgver='3.3.4'
pkgrel=2
pkgdesc="Tools for converting SVG graphics to TikZ/PGF code"
url="http://xyz2tex.github.io/svg2tikz/"
depends=('python')
optdepends=('python-inkex: Python extensions for Inkscape core'
	'python-lxml: Python binding for the libxml2 and libxslt libraries'
	'xclip: Command line interface to the X11 clipboard')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-poetry')
provides=("svg2tikz=${pkgver}")
conflicts=("svg2tikz-git")
license=('GPL-2.0-or-later')
arch=('any')
source=("https://github.com/xyz2tex/${_module}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2bf5f3456aa7969ad8a785c7a4dcab94a0b05e7b286a1a96ea26bd960b60e20e')

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
