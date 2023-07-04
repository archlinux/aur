# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=psd-tools
pkgname=python-$_name
pkgver=1.9.28
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
b2sums=('f96e642e6329f41ffdb9c590e8622c4cdf51ff35b8aeeea34a767cd03050f8a4fc582980a90ae5145c4ab292a4647b95809a4d0e5b33bc9119a5c412b3bed8ef')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
