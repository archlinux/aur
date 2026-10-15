# Maintainer: pngdeity <pngdeity@tutanota.com>
# Contributor: Michał Wojdyła <micwoj9292@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: brent s. <bts@square-r00t.net>
pkgname=python-whois
_name=python_whois
pkgver=0.9.6
pkgrel=2
pkgdesc='Whois querying and parsing of domain registration information'
arch=(any)
url='https://pypi.org/project/python-whois/'
license=(MIT)
depends=(python python-dateutil)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-pytest python-simplejson)
optdepends=('python-pysocks: SOCKS proxy support for whois queries')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2e6de7b6d70e305a85f4859cd17781ee3f0da3a02a8e94f23cb4cdcd2e400bfa')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
