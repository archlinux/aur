# Maintainer: daddodev
pkgname=pimpmyrice
provides=("pimpmyrice")
conflicts=("pimpmyrice-git" "pimpmyrice")
pkgdesc="The overkill rice manager"
url="https://github.com/daddodev/pimpmyrice"
pkgver=0.3.1
pkgrel=2
arch=("any")
license=("MIT")
depends=(
    "git"
    "python>=3.10"
    "python-setuptools"
    "python-requests"
    "python-psutil"
    "python-docopt"
    "python-rich"
    "python-jinja"
    "python-pyyaml"
    "python-scikit-learn"
    "python-opencv"
    "python-typing_extensions"
    "python-pydantic"
    "python-pydantic-extra-types"
)
makedepends=(
   "python-build"
   "python-installer"
   "python-wheel"
   "python-setuptools"
)
source=("$pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=("SKIP")


build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # license
    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
}
