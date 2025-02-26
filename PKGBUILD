# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=catppuccin
pkgname="python-$_pkgname"
pkgver=2.4.1
pkgrel=1
pkgdesc="Soothing pastel theme for Python"
arch=('any')
url="https://catppuccin-website.vercel.app"
license=('MIT')
depends=('python')
makedepends=(
  'python-build' 'python-installer' 'python-wheel'
  'python-hatchling'
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
sha256sums=('71d93f57428bd2a722ec1ba19cded135e712d555b87a7d98f645eb72ebbe7851')
b2sums=('260812648cbb397c38146c5f16374fb82157af8643b4af5ff3a179eefd4b4e53e65e1e5dc7549cfe79a065176ebaf42763bb2b008bf02295236c20d0b1973cad')

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
