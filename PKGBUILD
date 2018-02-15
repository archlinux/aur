# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=python-rstr
pkgname=('python-rstr' 'python2-rstr')
_pkgname=${pkgbase#python-}
pkgver=2.2.6
pkgrel=5
pkgdesc="Generate random strings in Python"
arch=('x86_64')
makedepends=('python-setuptools' 'python2-setuptools')
url="https://bitbucket.org/leapfrogdevelopment/rstr"
license=('BSD')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('5dea822326e418e0c9816c9cd14ae9c7be2d4cd4334043c397f202bc2ae2eda4')

prepare () {
    cp -a $_pkgname{,-py2}-$pkgver 
    find $_pkgname-py2-$pkgver -name \*.py -exec sed -r 's|^#!(.*)python$|#!\1python2|' -i {} +
}

build() {
  echo "Building Python3"
  cd $_pkgname-$pkgver
  python setup.py build

  echo "Building Python2"
  cd ../$_pkgname-py2-$pkgver
  python2 setup.py build
}

package_python-rstr() {
  depends=('python')

  cd $_pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt

}

package_python2-rstr() {
  depends=('python2')

  cd $_pkgname-py2-$pkgver
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt

}
