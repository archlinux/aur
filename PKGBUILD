# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-jsonrpcclient
_name=jsonrpcclient
pkgver=3.3.6
pkgrel=1
pkgdesc="Send JSON-RPC requests in Python."
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-nose')
url="https://github.com/bcb/jsonrpcclient"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('2f2d218de00ff7532f69efed2e2515d30c90f873e5cb91bf00de996dfb782f8a')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
  #namcap gives world bit not set in permissions
  chmod 644 jsonrpcclient.egg-info/* 
}

check(){
    cd "$srcdir/$_name-$pkgver"

    # For nosetests
    nosetests
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
