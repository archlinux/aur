pkgbase=python-plaster
pkgname=(python-plaster python2-plaster)
pkgver=1.0
_distname=plaster-$pkgver
pkgrel=1
pkgdesc="A loader interface around multiple config file formats."
arch=('any')
url="https://github.com/Pylons/plaster"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=(https://pypi.org/packages/source/p/plaster/plaster-${pkgver}.tar.gz)
sha256sums=('8351c7c7efdf33084c1de88dd0f422cbe7342534537b553c49b857b12d98c8c3')

prepare() {
    cp -r ${_distname}{,-py2}
}

check() {
    cd "$srcdir"/$_distname
    python setup.py pytest -v

    cd "$srcdir"/$_distname
    python2 setup.py pytest -v
}

package_python-plaster() {
    depends=('python-setuptools')
    cd $_distname
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Ddm755 "$pkgdir"/usr/share/licenses/$pkgname
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/
}

package_python2-plaster() {
    depends=('python2-setuptools')
    cd "$_distname-py2"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Ddm755 "$pkgdir"/usr/share/licenses/$pkgname
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/
}
