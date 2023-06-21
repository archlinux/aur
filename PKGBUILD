# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=psd-tools
pkgname=python-$_name
pkgver=1.9.26
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
b2sums=('db4db2d30eea3eaba3b28db48f73d385cf24962fdad36249f338bdc17b57f1024ebc17b45e8299da1a5bada831e683c8d3bc9dfa309dee40278d0c2b08f4f7a6')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
