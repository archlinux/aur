# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=python-hbctool
_name=hbctool
pkgver=0.1.5
pkgrel=1
pkgdesc="A command-line interface for disassembling and assembling the Hermes Bytecode"
arch=('any')
url="https://github.com/bongtrop/hbctool"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('30aeb050095ba507da2ed26ea8e64a75cd63d459d0db2eeb99e189fb8421c8a3')

latestver() {
    curl -fsSL 'https://pypi.org/pypi/hbctool/json' | python3 -c "import sys,json; print(json.load(sys.stdin)['info']['version'])"
}

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
