# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python-pydle-git
_pkgname=pydle
pkgver=0.7.1.r252.ga6bad04
pkgrel=1
pkgdesc="An IRCv3-compliant Python 3 IRC library."
arch=(any)
url="https://github.com/Shizmob/pydle"
license=('custom')
depends=('python' 'python-tornado')
makedepends=('python-setuptools' 'git')
source=('git+https://github.com/Shizmob/pydle.git')
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}  
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  python setup.py build
}

package() {
  cd ${_pkgname}
  python setup.py install --root=$pkgdir --optimize=1
  install -Dm644 "$srcdir/${_pkgname}/LICENSE.md" "$pkgdir/usr/share/licenses/python-pydle/LICENSE"
}
