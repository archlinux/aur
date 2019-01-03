# Maintainer: Leo Mao <leomaoyw at gmail dot com>
pkgname=python-pot
_pkgname=POT
pkgver=0.5.1
pkgrel=2
pkgdesc="Python Optimal Transport"
_github="rflamary/POT"
url="https://github.com/rflamary/POT/"
arch=('x86_64')
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-matplotlib')
optdepends=(
  'python-cupy: necessary to use `ot.gpu`'
  'python-autograd: necessary to use `ot.dr`'
  'python-pymanopt: necessary to use `ot.dr`'
)
makedepends=('python' 'python-setuptools' 'cython')
source=("https://github.com/rflamary/POT/archive/$pkgver.tar.gz")
md5sums=('a0aaad1c3163f2e14c11da3ee7a1a801')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
