
pkgname=python-dateutil-git
pkgver=2.9.0.post0.r95.g21b6862
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
        "0001-fix-many-deprecation-errors.patch")
sha256sums=('SKIP'
            '8ad1b10ac18d06ff8200c670e7e0d2bc1ed2a0afc5288bdc0c02aabad8068c45')

pkgver() {
    cd dateutil
    git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

prepare() {
    cd dateutil
    git apply ../0001-fix-many-deprecation-errors.patch
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
