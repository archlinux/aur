# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=catppuccin
pkgname="python-$_pkgname"
pkgver=1.1.1
pkgrel=1
pkgdesc="Soothing pastel theme for Python"
arch=('any')
url="https://catppuccin-website.vercel.app"
license=('MIT')
depends=('python')
makedepends=(
  'python-build' 'python-installer' 'python-wheel'
  'python-poetry-core' 'python-poetry-dynamic-versioning'
)
checkdepends=('python-pytest')
optdepends=(
  'python-pygments: For pygments integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/catppuccin/python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c5810c666c7c37aee3dbf325090a57579232d0ae15afee5a5bedb3536958f25')
b2sums=('6cd80407ef2db5df88d3159351366527d28c0180b069bf06d95708da6f2035a96c2ed0ef8d1aa078e00a5d62d624eaa77d1ecec0db2724faccaee67ae621b8c7')

build() {
  cd "python-$pkgver"

  export POETRY_DYNAMIC_VERSIONING_BYPASS="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "python-$pkgver"

  pytest
}

package() {
  cd "python-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
