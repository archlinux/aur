# Maintainer: daddodev
pkgname=pimpmyrice-git
provides=("pimpmyrice")
conflicts=("pimpmyrice-git" "pimpmyrice")
pkgdesc="The overkill theme manager (from git)"
url="https://github.com/daddodev/pimpmyrice"
pkgver=0.1.0
pkgrel=3
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
    "python-typing_extensions"
    "python-pydantic"
)
makedepends=(
   "python-build"
   "python-installer"
   "python-wheel"
   "python-setuptools"
)
source=("git+https://github.com/daddodev/pimpmyrice.git")
md5sums=("SKIP")

prepare() {
    git -C "${srcdir}/pimpmyrice" clean -dfx
}

build() {
    cd pimpmyrice
    python -m build --wheel --no-isolation
}

package() {
    cd pimpmyrice
    python -m installer --destdir="$pkgdir" dist/*.whl

    # license
    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
}
