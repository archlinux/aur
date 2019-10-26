# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=blockdiag
pkgver=1.5.4.20180722
_commit=4767d8eea98454c50ec7f39f0f1849a2c3969aab
pkgrel=2
pkgdesc="blockdiag generates block-diagram image from text"
url="http://blockdiag.com"
license=('Apache')
arch=('any')
depends=('python-setuptools' 'python-funcparserlib' 'python-pillow' 'python-webcolors')
checkdepends=('python-nose' 'python-mock' 'python-pycodestyle' 'python-reportlab' 'python-docutils'
              'python-wand' 'ghostscript' 'librsvg')
source=("$pkgname-$_commit.tar.gz::https://github.com/blockdiag/blockdiag/archive/$_commit.tar.gz")
sha512sums=('26939f4d33f218baac879b53ff1d887d5a990b185568347b167e2aa431aa37c475003b993583db5d43546c2560eacf50b718ad96f4cb784a08a1ee5e9e43d61d')

prepare() {
  mv blockdiag-{$_commit,$pkgver}
  sed -i 's/pep8/pycodestyle/' blockdiag-$pkgver/setup.py
}

build() {
  cd blockdiag-$pkgver
  python setup.py build
}

check() {
  cd blockdiag-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages" nosetests || warning "Tests failed"
}

package() {
  cd blockdiag-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
