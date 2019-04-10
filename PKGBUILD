# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-berliner
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.0.8
pkgrel=1
pkgdesc="Tools for Padova+PARSEC stellar tracks & isochrones"
arch=('i686' 'x86_64')
url="https://github.com/hypergravity/berliner"
license=('MIT')
makedepends=('python-pip')
depends=('python-scipy' 'python-regli' 'python-joblib')
optdepends=('python-astropy: For testing')
source=("https://files.pythonhosted.org/packages/py3/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}-py3-none-any.whl")
md5sums=('110a30ec9cac4f72c95cd6fa4b87a7a5')
_pyver=$(python -V | cut -c 8-10)

package() {
    cd ${srcdir}

    install -D -m644 ${_pyname}-${pkgver}.dist-info/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps *.whl
    python -O -m compileall "${pkgdir}/usr/lib/python${_pyver}/site-packages/${_pyname}"
}
