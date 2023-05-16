# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Orignal Maintainer: Nicolas Quiénot <niQo @ aur>
pkgname=python-pretty-cron
_pkgname=pretty-cron
pkgver=1.2.0
pkgrel=2
pkgdesc="Converts crontab expressions to human-readable descriptions."
arch=('i686' 'x86_64')
url="https://github.com/adamchainz/pretty-cron"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/adamchainz/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('8bd4ad0e16859cd7cfd41f77bc17575b')

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd ${_pkgname}-${pkgver}
    python -m installer --destdir=test_dir dist/*.whl
    export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
    pytest -vv
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
