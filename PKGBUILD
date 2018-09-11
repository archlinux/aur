# Maintainer: peippo <christoph.fink@gmail.com>

pkgbase=python-webhoseio
pkgname=('python-webhoseio' 'python2-webhoseio')
pkgver=0.1.5
pkgrel=0

pkgdesc="Simple client library for the webhose.io REST API"
url="https://github.com/Webhose/webhoseio-python/"
license=('MIT')

arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')

source=("https://files.pythonhosted.org/packages/ed/5b/6226f7cdf021ad1faf9967dc58247161233e09aa36ba71a6e4dab75fd7f2/webhose-0.1.5.tar.gz")
sha256sums=('3d96bda569e7a36da2884ecff03c26a5f3b9267176114ec18aa9f9d3cbddf238')

prepare() {
   rm -r webhose-$pkgver/*.egg-info
   cp -a webhose-$pkgver{,-py2}
}

build() {
   cd "$srcdir"/webhose-$pkgver
   python setup.py build
 
   cd "$srcdir"/webhose-$pkgver-py2
   python2 setup.py build
}

check() {
   cd "$srcdir"/webhose-$pkgver
   python setup.py test

   cd "$srcdir"/webhose-$pkgver-py2
   python2 setup.py test
}
 
package_python-webhoseio() {
   depends=('python' 'python-requests')
 
   cd webhose-$pkgver
   python setup.py install --root="$pkgdir" --optimize=1 --skip-build
   install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
 
package_python2-webhoseio() {
   depends=('python2' 'python2-requests')
 
   cd webhose-$pkgver-py2
   python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
   install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
