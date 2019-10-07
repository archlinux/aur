# Maintainer: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>

pkgbase=python-beniget
pkgname=('python-beniget' 'python2-beniget')
pkgver=0.2.0
pkgrel=1
pkgdesc="A static analyzer for Python2 and Python3 code"
arch=('i686' 'x86_64')
url="https://beniget.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
_name=${pkgbase#python-}
source=("$pkgbase-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4495fb8ef0e99f9291c751856e3cc0695115e7936acc54717a3f620ab331b247')

prepare() {
  cp -a beniget-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/beniget-$pkgver
  python setup.py build

  cd "$srcdir"/beniget-$pkgver-py2
  python2 setup.py build
}

package_python-beniget() {
  depends=('python' 'python-gast')
  provides=('python-beniget')

  cd "$srcdir"/beniget-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -m755 -d "${pkgdir}/usr/share/licenses/python-beniget"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/python-beniget/"
}

package_python2-beniget() {
  depends=('python2' 'python2-gast')
  provides=('python2-beniget')

  cd "$srcdir"/beniget-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1  --skip-build
  install -m755 -d "${pkgdir}/usr/share/licenses/python2-beniget"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/python2-beniget/"
}
