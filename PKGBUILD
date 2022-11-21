# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python38-trio
pkgver=0.22.0
pkgrel=2
pkgdesc='A friendly Python library for async concurrency and I/O'
arch=(any)
url=https://github.com/python-trio/trio
license=(MIT)
depends=(
  python38
  python38-async_generator
  python38-attrs
  python38-exceptiongroup
  python38-idna
  python38-outcome
  python38-sniffio
  python38-sortedcontainers
)
makedepends=(
  git
  python38-setuptools
)
provides=(python38-multio-provider)
_tag=87ea87018da2085180138bd952abcac67961be62
source=(git+https://github.com/python-trio/trio.git#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd trio
  _version=$(git describe --tags | sed 's/^v//')
  echo "__version__ = '${_version}'" > trio/_version.py
  echo ${_version}
}

build() {
  cd trio
  python3.8 setup.py build
}

package() {
  cd trio
  python3.8 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python38-trio/
}

# vim: ts=2 sw=2 et:
