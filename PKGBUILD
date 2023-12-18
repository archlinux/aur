# Maintainer: Thomas <thomas.aur@brainfuck.space>

pkgname=python-pillow-jpegxl-plugin
_pkgname=pillow-jpegxl-plugin
pkgver=1.0.1
pkgrel=2
pkgdesc="A Python Pillow plugin that adds jxl support"
arch=("any")
url="https://github.com/Isotr0py/$_pkgname"
license=("MIT")
depends=("python" "python-pillow")
#TODO: check which dependencies are really required
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools" "python-pytest-runner" "python-maturin" "rust" "maturin")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('49c030900f900879247c8a4f48f5fa913e9533e87861d18af93a4a2df699f4b9')

build() {
    cd "$_pkgname-$pkgver"
    # Ugly hack to get it linking
#    sed -i 's/=static//g' build.rs
#    sed -i 's/-static//g' build.rs
#    python -m build --wheel --no-isolation
    maturin build --release --features vendored
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
