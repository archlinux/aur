# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Slithery <aur at slithery dot uk>

pkgbase=(python-linode_api4-git)
pkgname=(python-linode_api4-git python2-linode_api4-git)
pkgver=4.1.9b1.r40.gbd9135d
pkgrel=1
pkgdesc="Bindings for the Linode API v4"
arch=('any')
url="https://github.com/linode/linode_api4-python"
license=('BSD')
makedepends=('python-setuptools' 'python-future'
             'python2-setuptools' 'python2-future')
source=("git+https://github.com/linode/linode_api4-python")
sha256sums=('SKIP')

pkgver() {
  cd linode_api4-python
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cp -a linode_api4-python{,-py2}
}

build() {
  cd "$srcdir/linode_api4-python"
  python setup.py build

  cd "$srcdir/linode_api4-python-py2"
  python2 setup.py build
}

package_python-linode_api4-git() {
  depends+=('python-future')
  provides=('python-linode_api4' 'python-linode-api')
  conflicts=('python-linode_api4' 'python-linode-api')

  cd linode_api4-python
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-linode_api4-git() {
  depends+=('python2-future')
  provides=('python2-linode_api4' 'python2-linode-api')
  conflicts=('python2-linode_api4' 'python2-linode-api')

  cd linode_api4-python-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
