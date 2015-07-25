# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-bitcoin
pkgver=1.1.33
pkgrel=1
pkgdesc="Python Bitcoin Tools"
arch=('any')
depends=('python' 'python-six')
makedepends=('python-setuptools')
url="https://github.com/vbuterin/pybitcointools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('02797eca548c91d3b269a9de433d2f59')
sha256sums=('72471b71575b80f7c767c3d643893416c50efbd8061192c14dced518e1c1ea12')
provides=('pybitcointools' 'pybtctool' 'python-bitcoin' 'python-pybitcointools')
conflicts=('pybitcointools' 'pybtctool' 'python-pybitcointools' 'python-python-bitcoinlib')

prepare(){
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Fixing setup.py...'
  sed -i '/data_files.*/d' setup.py
}

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
