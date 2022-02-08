# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: dobedobedo <dobe0331 at gmail dot com>
_pkgname='kealib'
pkgname=("python-$_pkgname")
_kea=1.4.14
pkgver=0.1_$_kea
pkgrel=2
pkgdesc="Python library to access parts of kealib not exposed by GDAL"
arch=('x86_64')
url='http://kealib.org'
license=('MIT')
makedepends=('python-setuptools')
depends=("kealib=$_kea" 'python')
options=(!emptydirs)
source=("https://github.com/ubarsc/kealib/releases/download/$_pkgname-$_kea/$_pkgname-$_kea.tar.gz")
sha256sums=('da5d4a540b34afb61665cb7b6bf284825b51464eaf2a23ccca16955e2712cab2')

build() {
  cd "$srcdir/$_pkgname-$_kea/python"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$_kea/python"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
