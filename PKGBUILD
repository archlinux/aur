# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=python-aletheia-probe
_name="aletheia_probe" # replaced - with _
pkgver=0.8.0
pkgrel=1
pkgdesc="detect predatory journals and conferences using authoritative data sources"
arch=(any)
url="https://github.com/sustainet-guardian/aletheia-probe"
license=('MIT')
depends=(
    python
    python-aiohttp
    python-aiofiles
    python-click
    python-pyyaml
    python-rarfile
    python-pydantic
    python-pypdf
    python-pybtex
    python-openpyxl
)
optdepends=(
    python-twine
    python-packaging
    python-requests
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=(    https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz)
sha256sums=('4d989f3e2e9157af82bfbb49e7f1ef8745af7e59a21402cc94b70a435a593ac2')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    mkdir -p "$pkgdir/usr/share/licenses/python-aletheia-probe/"
    cp LICENSE "$pkgdir/usr/share/licenses/python-aletheia-probe/"
}
