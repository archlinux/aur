# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgbase=python-shutilwhich
pkgname=(python-shutilwhich python2-shutilwhich)
pkgver=1.1.0
pkgrel=4
pkgdesc="Backport of shutil.which"
url="https://github.com/mbr/shutilwhich"
arch=('any')
license=('PSF')
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mbr/shutilwhich/archive/${pkgver}.tar.gz")
sha256sums=('4292a973312c58ca1935ea75d7bd378b17668ef6aacfc812d00019e0726dea44')

prepare() {
  cp -a shutilwhich-$pkgver{,-py2}
}

build(){
  cd "$srcdir/shutilwhich-$pkgver"
  python setup.py build

  cd "$srcdir/shutilwhich-$pkgver-py2"
  python2 setup.py build
}

package_python2-shutilwhich() {
  depends=('python2')
  cd "shutilwhich-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python-shutilwhich() {
  depends=('python')
  cd "shutilwhich-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

