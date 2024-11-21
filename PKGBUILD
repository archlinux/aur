# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=psd-tools
pkgname=python-$_name
pkgver=1.10.3
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
makedepends=(cython python-build python-installer python-setuptools python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('f9853eda4f428790ab728f3e23f38ef24dbd4038f94288a2009bd0b45032710b579c2753867447ad8002293dc04570e888d571b3b5ce3e6676dcc8a68bc1c439')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
