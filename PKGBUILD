# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC1091,SC2034,SC2154,SC2164

_name=shutilwhich

pkgname=python-shutilwhich
pkgver=1.1.0
pkgrel=9
pkgdesc="A copy & paste backport of Python 3.3's shutil.which function."

arch=("any")
license=("PSF")
url="https://github.com/mbr/shutilwhich"

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('4292a973312c58ca1935ea75d7bd378b17668ef6aacfc812d00019e0726dea44')

depends=(
  "python"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-setuptools"
  "python-wheel"
)
checkdepends=(
    "python-virtualenv"
)

build () {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check () {
    cd "$srcdir/$_name-$pkgver"

    python -m venv venv
    (
        source venv/bin/activate
        pip install ./dist/*.whl pytest
        python -m pytest
    )
    rm -rf venv
}

package () {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
