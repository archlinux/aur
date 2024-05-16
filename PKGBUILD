# Maintainer: a821 at mail de
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-libnacl
pkgver=2.1.0
pkgrel=1
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='https://libnacl.readthedocs.org'
license=('Apache-2.0')
depends=('python' 'libsodium')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("https://github.com/saltstack/libnacl/archive/v$pkgver/libnacl-$pkgver.tar.gz")
sha512sums=('717aec5fcc9ffbb7fef5f265861f86a087cc1ad1a122d752b1d8447bf495b98106056f19ff2ad1001ca81b84085ae6167ec96db2c2f3823f0f9a72a2a54788df')

build() {
  cd libnacl-$pkgver
  python -m build -nw
}

check() {
  cd libnacl-$pkgver
  python -m unittest discover --start-directory tests -v
}

package() {
  cd libnacl-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
}
