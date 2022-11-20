# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-sortedcontainers
pkgver=2.4.0
pkgrel=3
pkgdesc="Python Sorted Container Types: SortedList, SortedDict, and SortedSet"
arch=('any')
license=('Apache')
url="http://www.grantjenks.com/docs/sortedcontainers/"
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/grantjenks/python-sortedcontainers/archive/v$pkgver.tar.gz")
sha512sums=('f80185c6f95a85cc78f88f6f6cf389eb48be22cf94d5fcd84f3592873f17de37ec7f44c1627b7f02956ac4b4f74ca4febefc47d3c6232f70ee05dbb2449ad770')

prepare() {
  # Don't use tox
  sed -i '/tests_require/d' python38-sortedcontainers-$pkgver/setup.py
}

build() {
  cd python38-sortedcontainers-$pkgver
  python3.8 setup.py build
}

check() {
  cd python38-sortedcontainers-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd python38-sortedcontainers-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
