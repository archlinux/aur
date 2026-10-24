
pkgname=python-dateutil-git
pkgver=3.0.0.r22.g64914d9b
pkgrel=1
pkgdesc="Provides powerful extensions to the standard datetime module"
arch=('any')
license=('BSD-3-Clause' 'Apache-2.0')
url="https://github.com/dateutil/dateutil"
depends=('python-six')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer' 'python-setuptools-scm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
        "0001-fix-deprecation-warnings.patch")
sha256sums=('SKIP'
            '92cdcf00fb78ee16b0be5d343d88a5b5262d5e4e9177daea1cf57d113aaed688')

pkgver() {
    cd dateutil
    git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

prepare() {
    cd dateutil
    git apply ../0001-fix-deprecation-warnings.patch
}

build() {
    cd dateutil
    python -m build --wheel --no-isolation
}

package() {
    cd dateutil
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set ts=4 sw=4 et:
