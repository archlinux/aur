# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=psd-tools
pkgname=python-$_name
pkgver=1.26.1
pkgrel=1
pkgdesc='Python package for working with Adobe Photoshop PSD files'
arch=(any)
url='https://github.com/psd-tools/psd-tools'
license=('MIT')
depends=('python>=3.8'
         'python-docopt>=0.6.0'
         'python-attrs>=23.0.0'
         'python-pillow>=10.3.0'
         python-aggdraw
         python-numpy
         python-scipy
         python-scikit-image)
makedepends=(cython python-build python-installer python-setuptools python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('612c517952b615c3aa6a23d57cd9279d86ecac107307f809cdc150a84c9049efed5e90cd3685d1100db27ebd43f178cb1d4a021d37043a911a89955d2508d772')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
