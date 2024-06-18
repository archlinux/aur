# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=catppuccin
pkgname="python-$_pkgname"
pkgver=2.3.0
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
sha256sums=('d567a5ef0c2069024a063d2cba8baeb406a3cf9cb29c73428b706b863db9a3e4')
b2sums=('5675dfe4f87b9b37bc7d6115e664fd4b407cffe2bf7041ff49ad22010824f9deca28dfb6e1837cb6bd4fcd341376c682632cbf3ea794e217614a627a8997051e')

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
