# Maintainer: Martin Marmsoler <martin.marmsoler@gmail.com>

pkgname=python-sphinx-contrib-youtube-git
pkgver=r93.g4ffb539
pkgrel=1
pkgdesc="This package contains the youtube Sphinx extension."
arch=('any')
url='https://github.com/sphinx-contrib/youtube'
license=('BSD 3-Clause')
depends=(python python-sphinx python-requests)
makedepends=(python-flit)
checkdepends=(python python-pytest)
source=("git+https://github.com/sphinx-contrib/youtube.git")
sha256sums=('SKIP')

pkgver() {
  cd "youtube"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "youtube"
  flit build --format wheel
}

check() {
  cd "youtube"
  pytest
}

package() {
  cd "youtube"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

