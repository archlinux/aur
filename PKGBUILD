# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=psd-tools
pkgname=python-$_name
pkgver=1.11.0
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
b2sums=('af32e13c8bc1bf1c87ef487af7ce2f39e4b0d328926ddb857b27fde47872cddfb07154b05e623aacac0106664cb2441fdb0a495487afb684f2fc6415c2208922')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
