# Maintainer:
# Contributor: Michal Lisowski <lisu87@gmail.com>

_pkgname=relevation
pkgname="$_pkgname"
pkgver=1.3.1
pkgrel=4
pkgdesc="Command-line search for Revelation Password Manager files"
url="http://p.outlyer.net/relevation"
license=('BSD')
arch=('any')

depends=(
  'python-pycryptodome'
  'python-lxml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$url/files/$_pkgsrc.$_pkgext")
sha256sums=('73deca0610704daa8a55db00534fab3205caa6b905afca1b1bb795b88b909a6c')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="${pkgdir:?}" dist/*.whl
  install -D -m644 LICENSE -t "${pkgdir:?}/usr/share/licenses/$pkgname/"
}
