# Maintainer: Your Name <your.email@example.com>

pkgname=python-atreyu_backtrader_api-git
_pkgname=atreyu-backtrader-api
pkgver=r49.43bdb04
pkgrel=1
pkgdesc="Python IB API for backtrader - Pluggable Interactive Brokers integration for backtrader"
arch=('any')
url="https://github.com/atreyuxtrading/atreyu-backtrader-api"
license=('BSD')
depends=('python' 'python-backtrader')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${_pkgname}::git+https://github.com/atreyuxtrading/atreyu-backtrader-api.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
