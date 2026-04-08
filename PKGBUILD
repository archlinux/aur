pkgname='python-proglog'
_module='proglog'
pkgver='0.1.12'
pkgrel=2
pkgdesc="Log and progress bar manager for console, notebooks, web..."
url="https://github.com/Edinburgh-Genome-Foundry/proglog"
depends=('python' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('MIT')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('361ee074721c277b89b75c061336cb8c5f287c92b043efa562ccf7866cda931c')

latestver() {
    curl -fsSL "https://pypi.org/pypi/${_module}/json" | jq -r '.info.version'
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    rm -rf build dist ./*.egg-info
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
