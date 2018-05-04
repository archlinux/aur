# Maintainer: Jakob Gerhard Martinussen <jakobgm at gmail dot com>

_pypi_name=mypy_extensions
pkgname=python-${_pypi_name}
pkgver=0.3.0
pkgrel=1
pkgdesc='Experimental type system extensions for programs checked with the mypy typechecker.'
arch=('any')
url='http://www.mypy-lang.org/'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/m/$_pypi_name/$_pypi_name-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/python/mypy/master/extensions/LICENSE')
sha256sums=('c4553f2475996c912658d3c2f398766cd47a65e0c2c6bb27ac8dea94a21640f4'
            'a50450da1d53cd777b80ced77c58ff96abe0ccd879706bd142c3ec20e245f0b4')

build() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py build
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1 --skip-build
}
