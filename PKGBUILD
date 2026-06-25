# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-svg2tikz'
pkgname=('python-svg2tikz')
_module='svg2tikz'
pkgver='3.3.6'
pkgrel=1
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
sha256sums=('60a8f8f235ea02c347f85664ca72b4177e1830ef218a7f9e4ec2cfd1b9bdcfef')

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
