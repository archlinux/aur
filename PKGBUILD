# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=psd-tools
pkgname=python-$_name
pkgver=1.9.24
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
b2sums=('466fa1117b4b1445d227e679b88bfa2c51b040f7eefa5e342f552fb674ff597299bb70f4a4db72683d8ac8d992039e453d7bad3fb7ac0f6726e8b5763fdc5abd')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
