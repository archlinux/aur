# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgbase=python-pytimeparse
pkgname=('python-pytimeparse' 'python2-pytimeparse')
_pkgname=${pkgbase#python-}
pkgver=1.1.7
pkgrel=2
pkgdesc="A small Python library to parse various kinds of time expressions"
arch=('x86_64')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
url='https://github.com/wroberts/pytimeparse'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('51b641bcd435e0cb6b9701ed79cf7ee97fa6bf2dbb5d41baa16e5486e5d9b17a')

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

package_python-pytimeparse() {
  depends=('python')

  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pytimeparse() {
  depends=('python2')

  cd $_pkgname-py2-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
