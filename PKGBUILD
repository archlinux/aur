# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-libnacl
pkgver=1.9.0
pkgrel=2
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='https://libnacl.readthedocs.org'
license=('Apache')
depends=('python' 'libsodium')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("https://github.com/saltstack/libnacl/archive/v$pkgver/libnacl-$pkgver.tar.gz")
sha512sums=('1c1011f218864f4eab6a985a957f7ec5b8a227ed107ab336a0bc076be10bae6d598f3e81f3a20177e81f25f93c36b23118f515b98f87e11b1f727cae3db1e267')

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
