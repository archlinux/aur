# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-lru-dict
pkgver=1.3.0
pkgrel=2
pkgdesc='A fast and memory efficient LRU cache for Python'
arch=(x86_64)
url=https://github.com/amitdev/lru-dict
license=(MIT)
depends=(
  glibc
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
_tag=51c2761d94fd6fc85faea550240814938d1594f9
source=(git+https://github.com/amitdev/lru-dict.git#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd lru-dict
  git describe --tags | sed 's/^v//'
}

build() {
  cd lru-dict
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" lru-dict/dist/*.whl
  install -Dm 644 lru-dict/LICENSE -t "${pkgdir}"/usr/share/licenses/python-lru-dict/
}

# vim: ts=2 sw=2 et:
