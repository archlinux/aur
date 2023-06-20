# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=psd-tools
pkgname=python-$_name
pkgver=1.9.25
pkgrel=1
pkgdesc='Python package for working with Adobe Photoshop PSD files'
arch=(any)
url='https://github.com/psd-tools/psd-tools'
license=('MIT')
depends=('python>=3.7' 
         'python-docopt>=0.5'
         'python-attrs>=19.2.0'
         'python-pillow>=6.2.0'
         python-aggdraw
         python-numpy
         python-scipy
         python-scikit-image)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('94c88bd93318b0f23cc91bf8a0f9b7ea7580127260650e0b9a962359c6ae65782f5efd068e3e438423a33b087bafe63f0a841831e1689f1177b37f276ce19181')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
