# Contributor: Vladimir Gorbunov <truedaemon@gmail.com>

pkgbase=python-svglib
pkgname=('python2-svglib' 'python-svglib')
_name=svglib
pkgver=0.8.1
pkgrel=2
pkgdesc="A pure-Python library for reading and converting SVG files."
arch=('any')
url="http://pypi.python.org/pypi/svglib/$pkgver"
license=('LGPL')
options=(!emptydirs)
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "xrange.patch")
sha256sums=('1f8cb633f154b83987e3a906a55cf69c8739c0df5ea4eee024677c3e8fb62f55'
            '21d9f9634ba0c92ee6b21c720978a3825ff92974177cab17e72015c62ec10a47')

prepare() {
    cd "$srcdir/svglib-$pkgver"
    # Fix python 3 compatibility
    patch -Np1 -i "${srcdir}/xrange.patch"
}

package_python2-svglib() {
    cd "$srcdir/svglib-$pkgver"
    depends=('python2' 'python2-reportlab' 'python2-lxml')
    python2 setup.py install --root="$pkgdir/" --optimize=1
    mv "${pkgdir}/usr/bin/svg2pdf" "${pkgdir}/usr/bin/svg2pdf-py2"
}

package_python-svglib() {
    cd "$srcdir/svglib-$pkgver"
    depends=('python' 'python-reportlab' 'python-lxml')
    python setup.py install --root="$pkgdir/" --optimize=1
}
