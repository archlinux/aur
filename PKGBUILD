# Maintainer: Leo Mao <leomaoyw at gmail dot com>
pkgname=python-pot
_pkgname=POT
pkgver=0.9.0
pkgrel=1
pkgdesc="Python Optimal Transport"
_github="rflamary/POT"
url="https://github.com/PythonOT/POT/"
arch=('x86_64')
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-matplotlib')
optdepends=(
  'python-cupy: necessary to use `ot.gpu`'
  'python-autograd: necessary to use `ot.dr`'
  'python-pymanopt: necessary to use `ot.dr`'
)
makedepends=('python' 'python-setuptools' 'cython' 'python-pip')
source=("https://github.com/PythonOT/POT/archive/$pkgver.tar.gz")
md5sums=('73d1ce9a5f6108f1baf04ffb78d10b47')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
