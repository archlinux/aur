# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=catppuccin
pkgname="python-$_pkgname"
pkgver=1.3.2
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
  'python-rich: For rich integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/catppuccin/python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ebe19d1e1265eec8a442d9450dc661ca798f4b936a7ee5c4436c83930d2de7e0')
b2sums=('faa7278fdb598bee21e4cc19a06b0b7ce1435e6aa845173819187adfc17c1b4000af6812192d85c9bb582ba61bfb4158d736dbdb9981ddb63e7af006f7d75f77')

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
