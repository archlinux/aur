# Maintainer: <https://aur.archlinux.org/account/zeauw>

_name=glasflow
pkgname=python-${_name}
pkgver=0.4.0
pkgrel=1
pkgdesc="Normalising flows implemented using nflows."
arch=('any')
url='https://github.com/uofgravity/glasflow'
license=('MIT')
depends=('python-pytorch')
makedepends=('python-setuptools' 'python-wheel' 'python-setuptools-scm' 'python-build' 'python-installer')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2ed62e797f0c81daf11023ff7e59e9bd056673bb54ae09566d3c0f78e56e89e1')
_commit='4c1bb65b37584142c48c33109db13b3f18cd4084'

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    cd ${_name}-${pkgver}
    cd submodules
    git clone https://github.com/uofgravity/nflows/; cd nflows; git checkout ${_commit}; cd ..
    cd ..
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
