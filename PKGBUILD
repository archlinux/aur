# Maintainer: a821

pkgname=python-lmfit-git
pkgver=1.2.1.r3.g502cc9ba
pkgrel=1
pkgdesc="Non-Linear Least-Squares Minimization and Curve-Fitting for Python"
arch=('any')
url="https://lmfit.github.io/lmfit-py"
license=('BSD')
depends=('python-asteval' 'python-numpy' 'python-scipy' 'python-uncertainties')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
optdepends=(
    'python-corner'
    'python-emcee'
    'python-pandas'
    'python-matplotlib'
    'python-dill'
    'python-numdifftools'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/lmfit/lmfit-py')
md5sums=('SKIP')

pkgver() {
    git -C lmfit-py describe --long --tags | sed 's/-/.r/;s/-/./g'
}

build() {
    cd lmfit-py
    python -m build --wheel --no-isolation
}

package() {
    cd lmfit-py
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
