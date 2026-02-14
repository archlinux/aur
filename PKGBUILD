# Maintainer: LY <ly-niko@qq.com>

pkgname=python-py-key-value-aio
_name=py_key_value_aio
pkgver=0.4.0
pkgrel=1
pkgdesc="Async key-value store with pluggable backends"
arch=('any')
url="https://github.com/chrisguidry/py-key-value-aio"
license=('Apache')
depends=(
  'python>=3.10'
  'python-beartype'
  'python-typing_extensions'
)
optdepends=(
  'python-cachetools: memory backend support'
  'python-redis: redis backend support'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
source=("https://files.pythonhosted.org/packages/d5/42/4397b26c564a7428fbb424c353fc416c5954609c149b6d629255f65e6dc9/${_name}-${pkgver}.tar.gz")
sha256sums=('55be4942bf5d5a40aa9d6eae443425096fe1bec6af7571502e54240ce3597189')

prepare() {
  cd "${_name}-${pkgver}"
  sed -i 's/uv_build>=0.8.2,<0.9.0/uv_build>=0.8.2,<1.0.0/' pyproject.toml
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
