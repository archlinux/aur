# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-sqlmodel
_pkgname="${pkgname#python-}"
pkgver=0.0.6
pkgrel=1
pkgdesc="SQL databases in Python, designed for simplicity, compatibility, and robustness"
arch=('any')
url="https://sqlmodel.tiangolo.com"
license=('MIT')
depends=(
  'python'
  'python-sqlalchemy'
  'python-pydantic'
  'python-sqlalchemy2-stubs'
)
makedepends=(
  'python-build'
  'python-poetry-core'
  'python-install'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiangolo/sqlmodel/archive/$pkgver.tar.gz")
sha512sums=('729cd74a806f3e035e6eae8c2083dc8fbbd89675d1827767bb319d9898ec03e915eb53807e0675ce3b78c83ba95a052e082807a1905ca7a35b7bdf969b231732')
b2sums=('5cce28a29e4372685158e64e581fedef091f2ea5fbd307871965beefa79a50f912765cd98a2d13e8c454ea1df292d31367fc99e3846783ecbcd0e4c423aec19f')

build() {
  cd "$_pkgname-$pkgver"

  python -m build \
    --wheel \
    --skip-dependency-check \
    --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  python -m install \
    --optimize=1 \
    --destdir="$pkgdir" \
    dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
