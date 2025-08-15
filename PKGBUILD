# Maintainer: daddodev <daddodev@gmail.com>
pkgname=pimpmyrice
provides=("$pkgname")
conflicts=("${pkgname}-git" "$pkgname")
pkgdesc="The overkill theme manager"
url="https://github.com/daddodev/pimpmyrice"
pkgver=0.4.3
pkgrel=1
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
    "python-numpy"
    "python-pillow"
    "python-pydantic"
    "python-typing_extensions"
)
makedepends=(
   "python-build"
   "python-installer"
   "python-wheel"
   "python-setuptools"
)
source=("$pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=("SKIP")

build() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    python -m build --wheel --no-isolation || exit 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    python -m installer --destdir="$pkgdir" dist/*.whl || exit 1

    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE || exit 1
}
