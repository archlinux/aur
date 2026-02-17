# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-draccus
_pkgname=draccus
pkgver=0.11.5
pkgrel=1
pkgdesc="Slightly opinionated framework for simple dataclass-based configurations"
arch=('any')
url="https://github.com/dlwh/draccus"
license=('MIT')
depends=(
    'python'
    'python-mergedeep'
    'python-yaml'
    'python-pyyaml-include'
    'python-toml'
    'python-typing_inspect'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/d/$_pkgname/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b82e2c2027030ae1a0f105515125f914e050c0766ab518df3a0560a07d10ddc9')

prepare() {
    cd "$_pkgname-$pkgver"
    # Relax pyyaml-include pin for Arch (2.x is backward compatible)
    sed -i 's/pyyaml-include~=1.4/pyyaml-include>=1.4/' pyproject.toml
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    python -c "import draccus; print('draccus imported successfully')"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
