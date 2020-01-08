# Maintainer: peippo <christoph.fink@gmail.com>

pkgbase=python-dhash
pkgname=('python-dhash' 'python2-dhash')
pkgver=1.3
pkgrel=1

pkgdesc="Python library to calculate the difference hash (perceptual hash) for a given image, useful for detecting duplicates"
url="https://github.com/Jetsetter/dhash"
license=('MIT')

arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')

_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("e6c8cd09d330f1ac44d3c9735d6b2a637d713dcb6b6091e340f91dda2484acb8")

prepare() {
   cp -a dhash-$pkgver{,-py2}
}

build() {
   cd "$srcdir"/dhash-$pkgver
   python setup.py build

   cd "$srcdir"/dhash-$pkgver-py2
   python2 setup.py build
}

package_python-dhash() {
   depends=('python' 'python-pillow')
 
   cd dhash-$pkgver
   python setup.py install --root="$pkgdir" --optimize=1 --skip-build
   install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
 
package_python2-dhash() {
   depends=('python2' 'python2-pillow')
 
   cd dhash-$pkgver-py2
   python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
   install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
