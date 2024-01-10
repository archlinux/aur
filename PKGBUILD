# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=psd-tools
pkgname=python-$_name
pkgver=1.9.30
pkgrel=1
pkgdesc='Python package for working with Adobe Photoshop PSD files'
arch=(any)
url='https://github.com/psd-tools/psd-tools'
license=('MIT')
depends=('python>=3.8'
         'python-docopt>=0.6.0'
         'python-attrs>=23.0.0'
         'python-pillow>=10.0.0'
         python-aggdraw
         python-numpy
         python-scipy
         python-scikit-image)
makedepends=(cython python-build python-installer python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('c6ca3060367cac1ae57c2763418f986ed2be44f53d0a58a39ea9f7c6f34e00847251f2f9d5d897ca01d434fb79b052dea6066ce022afeb5906cb8f6c160a51fa')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
