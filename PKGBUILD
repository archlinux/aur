# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-iocapture
pkgname=('python-iocapture' 'python2-iocapture')
pkgver=0.1.2
pkgrel=5
pkgdesc="Capture stdout, stderr easily."
arch=('any')
license=('MIT')
url="https://github.com/oinume/iocapture"
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-flexmock'
              'python2-flexmock' 'python-pytest-cov' 'python2-pytest-cov'
              'python-six' 'python2-six')
source=("git+https://github.com/oinume/iocapture.git#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a iocapture{,-py2}
}

build() {
  cd "$srcdir/iocapture"
  python setup.py build

  cd "$srcdir/iocapture-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/iocapture"
  python setup.py pytest

  cd "$srcdir/iocapture-py2"
  python2 setup.py pytest
}

package_python-iocapture() {
  depends=('python')

  cd iocapture
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-iocapture() {
  depends=('python2')

  cd iocapture-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
