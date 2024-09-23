# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-parsy
_pkgname=parsy
pkgver=2.1
pkgrel=1
pkgdesc="Easy-to-use parser combinators in pure Python"
arch=('any')
url="https://github.com/python-parsy/parsy"
license=('MIT')
depends=(python)
checkdepends=(python-pytest)
optdepends=()
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('fd5dd18d7b0b61f8275ee88665f430a20c02cf5a82d88557f35330530186d7ac')

build(){
  cd "$_pkgname-$pkgver"
  python -m build -wn
}

package(){
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check(){
  cd "$_pkgname-$pkgver"
  PYTHONPATH=src pytest tests
}
