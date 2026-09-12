pkgname=python-aiospamc
pkgver=1.2.0
pkgrel=1
pkgdesc="Asyncio-based client for SpamAssassin's SPAMD service"
arch=('any')
url='https://github.com/mjcaley/aiospamc'
license=('MIT')

depends=(
  'python'
  'python-certifi'
  'python-loguru'
  'python-typer'
)

makedepends=(
  'python-build'
  'python-installer'
  'python-uv-build'
)

source=("https://files.pythonhosted.org/packages/source/a/aiospamc/aiospamc-${pkgver}.tar.gz")
sha256sums=('3933d5529ef54e48a183d7cdf2e63ca947e53d63645911ed29ece5e19d627183')

prepare() {
  cd "aiospamc-${pkgver}"
  sed -i 's/uv_build>=0\.7\.19,<0\.8\.0/uv_build/' pyproject.toml
}

prepare() {
  cd "aiospamc-${pkgver}"
  sed -i 's/uv_build>=0\.7\.19,<0\.8\.0/uv_build/' pyproject.toml
}

build() {
  cd "aiospamc-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "aiospamc-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
