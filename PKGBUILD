# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=readabledelta
_commit=608c46d737a22711d03083adb6baf30592715d31
pkgname=python-readabledelta
pkgver=0.0.2
pkgrel=2
pkgdesc="Human readable modification of timedelta"
arch=('any')
url="https://pypi.org/project/readabledelta/"
license=('Unlicense')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/wimglenn/readabledelta/archive/${_commit}.zip")
sha256sums=('97940af7e611780e14a8a7728414cc32f8b83423714703155b26d716924d979a')

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd ${_pkgname}-${_commit}
    python -m installer --destdir=test_dir dist/*.whl
    export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
    python test_readabledelta.py
}

build() {
    cd $srcdir/${_pkgname}-${_commit}
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}-${_commit}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
