# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-oslash
_pkgname=oslash
_name=OSlash
pkgver=2.0.0
pkgrel=1
pkgdesc="OSlash (Ø) is a library for playing with functional programming in Python 3.8+."
arch=('any')
depends=('python>=3.12')
makedepends=('python-build' 'python-installer' 'python-wheel')
url="https://github.com/dbrattli/OSlash"
license=('MIT')
options=('!emptydirs' '!strip')
source=(https://github.com/dbrattli/${_name}/archive/refs/tags/oslash-v${pkgver}.tar.gz)
sha256sums=('8d94b5a75a066e11aea678247acd0e7cd29ff9d478fa2ee83c494ea93b624afc')

build() {
  cd "$srcdir/$_name-$_pkgname-v$pkgver"
  python -m build --wheel --no-isolation
}

check(){
    cd "$srcdir"
    pytest
}

package() {
  cd "$srcdir/$_name-$_pkgname-v$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
