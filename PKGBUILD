# Mantainer: sgar < swhaat at github >

pkgname=python-chacha20poly1305-reuseable
_basename=chacha20poly1305-reuseable
pkgver=v0.12.1
pkgrel=1
pkgdesc='A reusable version of ChaCha20Poly1305 for use with cryptography and asyncio'
url=https://github.com/bdraco/chacha20poly1305-reuseable
license=(APACHE)
depends=(
  python
  python-poetry
  python-cryptography
)
makedepends=(
  cython
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
_tag=fc570bb974023b3c47042134f69516aa195abf61
source=(git+${url}#tag=${_tag})
b2sums=('b6803067b8536f24ebd96efcfbb4dcbab99265d52416949c0ffd319187e7c48fbeacbeef09eac9ab30e995054b8406bef57b3f3c2f12ca82b240df614455656b')
arch=(any)

pkgver() {
  cd ${_basename}
  git describe --tags
}

build() {
  cd ${_basename}
  python -m build -wn
}

package() {
  python -m installer -d "${pkgdir}" ${_basename}/dist/*.whl
  install -Dm 644 ${_basename}/LICENSE -t "${pkgdir}"/usr/share/licenses/python-chacha20poly1305-reuseable/
}
