# Maintainer: Thomas <thomas.aur@brainfuck.space>

pkgname=python-pillow-jpegxl-plugin
_pkgname=pillow-jpegxl-plugin
pkgver=1.3.2
pkgrel=3
pkgdesc="A Python Pillow plugin that adds jxl support"
arch=("any")
url="https://github.com/Isotr0py/$_pkgname"
license=("MIT")
depends=("python" "python-pillow" "libjxl")
makedepends=(python-maturin python-installer patchelf)
#checkdepends=(python-pytest-runner python-pyexiv2)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b90088d3bda401ee3ca0863262cae60fe455faa94363dd5609e6c9a9c8db8c3c')

build() {
    cd "$_pkgname-$pkgver"
    maturin build --release --features dynamic
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" target/wheels/*.whl
}

# Not running checks for now: the source tree is not in an importable state
# (Not sure of a clean way to fix this without duplicating a lot of work)
# check() {
#     cd "$_pkgname-$pkgver"
#     python -m pytest
# }
