# Mantainer: sgar < swhaat at github >

pkgname=python-chacha20poly1305-reuseable
_basename=chacha20poly1305-reuseable
pkgver=v0.13.2
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
_tag=276968800a17f4f6166956393e055e1e3531e3a7
source=(git+${url}#tag=${_tag})
b2sums=('78a2f6006ded87ab065183788f717af690164ff05caee46ba552707a5dd56caa4a38b5c2a535c059e9e02826f9844cad80a63b12e3551215a1a83dbd33a17165')
arch=(any)

pkgver() {
  cd ${_basename}
  git describe --tags
}

build() {
  cd ${_basename}
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" ${_basename}/dist/*.whl
  install -Dm 644 ${_basename}/LICENSE -t "${pkgdir}"/usr/share/licenses/python-chacha20poly1305-reuseable/
}
