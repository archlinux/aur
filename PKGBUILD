# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-expects
pkgname=('python-expects' 'python2-expects')
pkgver=0.8.0
pkgrel=3
pkgdesc="Expressive and extensible TDD/BDD assertion library for Python"
arch=('any')
license=('Apache')
url="https://github.com/jaimegildesagredo/expects"
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-mamba' 'python2-mamba')
source=("git+https://github.com/jaimegildesagredo/expects.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a expects{,-py2}
}

build() {
  cd "$srcdir"/expects
  python setup.py build

  cd "$srcdir"/expects-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/expects
  mamba

  cd "$srcdir"/expects-py2
  mamba2
}

package_python-expects() {
  depends=('python')

  cd expects
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-expects() {
  depends=('python2')

  cd expects-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
