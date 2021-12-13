# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-sqlmodel
_pkgname="${pkgname#python-}"
pkgver=0.0.5
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
sha512sums=('ce70137877d01015b29374ca96198a4dc718fbffc4f12e15eb8773703871a3bb3ede71ef961a6a43e578130f5da2fdbb6552d75ea25118d32debc06afbce2dda')
b2sums=('dee991122da4a799db91648455fb7595ed14eca6fed857c149ca54c0eeaf0c568adcbbb165ec3c394c34a5b7a3ee70908c5e40b87dafd82c458aa6b622202552')

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
