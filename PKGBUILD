# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=catppuccin
pkgname="python-$_pkgname"
pkgver=2.0.0
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
checkdepends=('python-pytest' 'python-pygments' 'python-rich')
optdepends=(
  'python-pygments: For pygments integration'
  'python-rich: For rich integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/catppuccin/python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e2c8a8c6b2d3814f389972f24449ab3dfe6bcd9d891772c2cb3f467314aacbc2')
b2sums=('4f2030d29467feb929099c64dec5ccdb7cc04ba74aee4fa69ae61acd754cef09f67ae3c1da7a59d39c7ae46bfb4aa8e5d3a93390495cc7c91029e804d7b12d6a')

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
