# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=eralchemy
pkgver=1.6.0
pkgrel=1
pkgdesc='Entity Relation Diagrams generation tool'
arch=('any')
url="https://github.com/eralchemy/$pkgname"
license=('Apache-2.0')
depends=('python' 'python-pygraphviz' 'python-sqlalchemy')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-flask-sqlalchemy' 'python-pytest')
source=("git+$url.git?signed#commit=v$pkgver")
sha256sums=('e74edeca6c67f1158aa7117bc6d157515d61c4dc485f71f6898986c9b670378c')
validpgpkeys=('65290D3F6915674534D87357D5B29CD0C9E06237') # Florian Maurer <f.maurer@outlook.de>

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -m 'not external_db'
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
