# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=python2-ipykernel
pkgver=4.10.0
pkgrel=1
pkgdesc="The ipython kernel for Jupyter"
arch=('any')
url="https://pypi.org/project/ipykernel/"
license=('BSD')
depends=('python2-traitlets' 'python2-tornado' 'ipython2' 'python2-jupyter_client')
makedepends=('python2-setuptools' 'ipython2' 'python2-jupyter_client')
checkdepends=('python2-pytest' 'python2-mock' 'python2-nose')
source=("ipykernel-$pkgver.tgz::https://github.com/ipython/ipykernel/archive/$pkgver.tar.gz")
md5sums=('08e99a7b03b4dffd02af190d4c021524')

# dep cycle with python-jupyter_client

prepare() {
  cd "$srcdir/ipykernel-$pkgver"

  # https://github.com/ipython/ipykernel/issues/332
  sed -i "s/executable='python'/executable='python2'/" setup.py
}

build() {
  cd "$srcdir/ipykernel-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/ipykernel-$pkgver"
  python2 -m pytest
}

package() {
  cd "$srcdir/ipykernel-$pkgver"

  python2 setup.py install  --root="$pkgdir" --optimize=0
  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
