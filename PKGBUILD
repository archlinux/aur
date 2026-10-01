# Maintainer: Techcable <Techcable at techcable dot net>
pkgname=python-term-background
pkgver=1.0.5
pkgrel=1
epoch=
pkgdesc="Python module to align a simple (not nested) list in columns."
arch=("any")
_srcname="term_background"
# Why is it prefixed with 'shell' instead of 'python'?
url="https://github.com/rocky/shell-term-background"
license=("GPLv2")
groups=()
depends=()
makedepends=("python-build" "python-setuptools" "python-installer")
checkdepends=("python-pytest")
backup=() # Anything we need to backup?
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/term_background-${pkgver}.tar.gz")
sha256sums=('50e428dfbf6a33e5076cd7898a42a77fc4c5b60e804b50c59e89ead7a22299bd')

prepare() {
    true; # Nothing to do I guess
}

build() {
    cd "${_srcname}-$pkgver"
    # The python packaging guidelines recommend --no-isolation
    # https://manual.archlinux.page/package-guidelines/python/#standards-based-pep-517
    python -m build --wheel --no-isolation
}

check() {
    cd "${_srcname}-$pkgver"
    PYTHONPATH="." pytest test;
}

package() {
    cd "${_srcname}-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}
