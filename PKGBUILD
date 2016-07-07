# Contributor: Andrea Scarpino <andrea@archlinux.org|

pkgbase=gitpython
pkgname=(python-gitpython python2-gitpython)
pkgver=2.0.6
pkgrel=1
pkgdesc='A python library used to interact with git repositories'
arch=('any')
url='https://gitpython.readthedocs.io/'
license=('BSD')
makedepends=('python' 'python2' 'python-gitdb' 'python2-gitdb')
source=(${pkgbase}-${pkgver}.tar.gz::"https://github.com/gitpython-developers/GitPython/archive/${pkgver}.tar.gz")
md5sums=('4439aeabe21eb76ead0c0c4c1b47b4b7')

prepare() {
  cp -a GitPython{,-py2}-${pkgver}
}

build() {
  cd GitPython-${pkgver}
  python setup.py build

  cd ../GitPython-py2-${pkgver}
  python2 setup.py build
}

package_python-gitpython() {
  depends=('git' 'python-gitdb')

  cd GitPython-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1

  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-gitpython() {
  depends=('git' 'python2-gitdb')

  cd GitPython-py2-${pkgver}
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
