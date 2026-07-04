# Maintainer: nanw <nanweisheng@gmail.com>
# Contributor: nanw <nanweisheng@gmail.com>

_name="perplexityai"
pkgname="python-$_name"
pkgver=0.39.0
pkgrel=1
pkgdesc="The official Python library for the Perplexity API"
arch=('any')
url="https://github.com/perplexityai/perplexity-py"
license=('Apache')
depends=(
  "python>=3.9"
  "python-anyio>=3.5.0"
  "python-distro>=1.7.0"
  "python-httpx>=0.23.0"
  "python-pydantic>=1.9.0"
  "python-sniffio"
  "python-typing_extensions>=4.14"
)
makedepends=(
  "python-build"
  "python-hatchling"
  "python-hatch-fancy-pypi-readme"
  "python-installer"
  "python-wheel"
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7cf965ddac7a570a157e102ff2146306d13f771c4205b2e16f9c051aca2e2616')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_name-$pkgver"
  python -c "import perplexityai; print('import OK')"
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
