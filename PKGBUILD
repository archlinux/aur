# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pyturbojpeg
pkgver=2.6.1
pkgrel=1
pkgdesc="Python wrapper for libjpeg-turbo image encoding and decoding"
arch=('any')
url="https://github.com/lilohuang/PyTurboJPEG"
license=('MIT')
_commit=85bf75eeac0da88584e57ced17709b173684ccde
depends=('python' 'python-numpy' 'libjpeg-turbo>=3.0')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pillow')
optdepends=('python-opencv: Display images with the module demonstration')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('aaa894e0c2d684e092acc3d6cccf2be2c9f6276e082e8fc1b7061454a78f50f9')

build() {
    cd "PyTurboJPEG-$_commit"
    python -m build --wheel --no-isolation
}

check() {
    cd "PyTurboJPEG-$_commit"
    TURBOJPEG_LIB_PATH=/usr/lib/libturbojpeg.so \
        python -m pytest -v tests --junitxml="$srcdir/pytest-results.xml"
}

package() {
    cd "PyTurboJPEG-$_commit"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
