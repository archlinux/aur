# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=catppuccin
pkgname="python-$_pkgname"
pkgver=2.3.1
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
checkdepends=(
  'python-pytest' 'python-pygments' 'python-rich'
  'python-matplotlib'
)
optdepends=(
  'python-pygments: For pygments integration'
  'python-rich: For rich integration'
  'python-matplotlib: For matplotlib integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/catppuccin/python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('303dbc17ad861802ba1951879ea44bdd980eb3dc18baa65d6ff6d2df4c3e3344')
b2sums=('816d17e049fad89f05b79d11462326163b4bb65201b35045d08fa4584d8fe0214c1ca046087c2ca20873b464e705f9bcfa86d9284ae4ce762ac28ee5a223efe3')

prepare() {
  cd "python-$pkgver"

  mv build.py build_palette.py
}

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
