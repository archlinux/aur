# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=psd-tools
pkgname=python-$_name
pkgver=1.10.9
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
b2sums=('0d52a2679aa5bae749663704d2758672c7a34de0cb5553a7ce652d2b05af03fd7ba0f47c87d50ab4faeda1e317f777048be87fabaa91840b340d06c93092e791')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
