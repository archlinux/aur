# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-doublex-expects
pkgname=('python-doublex-expects' 'python2-doublex-expects')
pkgver=0.7.0rc2
pkgrel=3
pkgdesc="Expects matchers for Doublex test doubles assertions"
arch=('any')
license=('Apache')
url="https://github.com/jaimegildesagredo/doublex-expects"
makedepends=('python-setuptools' 'python2-setuptools' 'python-doublex'
             'python2-doublex' 'python-expects' 'python2-expects' 'git')
checkdepends=('python-mamba' 'python2-mamba')
source=("git+https://github.com/jaimegildesagredo/doublex-expects.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a doublex-expects{,-py2}
}

build() {
  cd "$srcdir"/doublex-expects
  python setup.py build

  cd "$srcdir"/doublex-expects-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/doublex-expects
  mamba

  cd "$srcdir"/doublex-expects-py2
  mamba2
}

package_python-doublex-expects() {
  depends=('python-doublex' 'python-expects')

  cd doublex-expects
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-doublex-expects() {
  depends=('python2-doublex' 'python2-expects')

  cd doublex-expects-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
