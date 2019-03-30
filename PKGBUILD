# Maintainer: David McInnis <dave@dave3.xyz>
# Contributor: Gerald Kaszuba <pycallgraph@gakman.com>

pkgname=('python-pycallgraph')
_name='pycallgraph'
pkgver='1.0.1'
pkgrel=3
pkgdesc="Library and command line tool that visualises the flow of your Python application."
url="http://pycallgraph.slowchop.com/"
depends=('python')
makedepends=('python-setuptools' 'python-pygraphviz')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b1262b0f9831da889c6e9a9a82a22267df497013cd2f5b36c39359a607c91e71')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

# Importerror: 'No module named helpers'
#check() {
#    cd "${srcdir}/${_name}-${pkgver}"
#    python setup.py test
#}

package() {
    depends+=()
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 man/pycallgraph.1 $pkgdir/usr/share/man/man1/pycallgraph.1
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
