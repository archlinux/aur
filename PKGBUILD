# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=('netfetch' 'python-netfetch')
_realName=NetFetch
pkgdesc="Networked file storage and retrieval with optional password protection and compression using Redis"
pkgver=3.0.3
pkgrel=2
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/NetFetch"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python' 'python-redis' 'python-indexedredis')
source=("https://github.com/kata198/NetFetch/archive/${pkgver}.tar.gz")
backup=("etc/netfetch.cfg")
sha512sums=("4fa515a1fbf52965b99e08bd694b1010835be71bbf579eecefd5827cdfbb888744ad623d4f998b66e2a44561b0ce414de14b53375dfbfc19d332b8c2a2ff18e5")

build() {
  cd "$srcdir/${_realName}-$pkgver"
  python setup.py build
}

package_netfetch() {
  depends=('python-setuptools' 'python' 'python-netfetch')
  cd "${_realName}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  mkdir -p "${pkgdir}/etc"

  install -m 775 example.cfg "${pkgdir}/etc/netfetch.cfg"

  rm -Rf "${pkgdir}/usr/lib"
}

package_python-netfetch() {
  cd "${_realName}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  rm -Rf "${pkgdir}/usr/bin"
}
