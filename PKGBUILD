# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=psd-tools
pkgname=python-$_name
pkgver=1.9.27
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
b2sums=('4b46d4c198acfc89927ae1f0b8881029e9d7588633017ea7b9d075e4a7db4c859a7c2ef6e87cfce3381890f3af94c36fd6809e4366250f5328327b69b71af05a')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
