# Maintainer: dobedobedo <dobe0331 at gmail dot com>
_pkgname='alphashape'
pkgname=("python-$_pkgname")
pkgver=1.3.1
pkgrel=2
pkgdesc="Toolbox for generating n-dimensional alpha shapes."
arch=('x86_64')
depends=('python'
	 'python-click'
         'python-click-log'
         'python-shapely'
	 'python-numpy'
         'python-trimesh'
         'python-networkx'
         'python-rtree'
	 'python-scipy'
	)
makedepends=('python-build'
	     'python-installer'
	     'python-wheel' 
	     'python-setuptools'
             'python-pytest')
url='https://alphashape.readthedocs.io/en/latest/index.html'
license=('MIT')
sha256sums=('36538deb1d1d799416d6b5ac2b9e74d35695cc5d63a83110cfe53f257581e724'
            '3366d76a2f9b92bd8547bab96de169f9781b85209ade191132a407e6f2354a7e')
_source_url="https://github.com/bellockk/alphashape/archive/refs/tags"
source=("$_pkgname-$pkgver.tar.gz::$_source_url/v$pkgver.tar.gz"
	"c719566.patch")

prepare() {
    patch -d "$srcdir/$_pkgname-$pkgver" -Np1 -i "$srcdir/c719566.patch"
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check(){
    cd "$srcdir/$_pkgname-$pkgver"
    pytest
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
} 
