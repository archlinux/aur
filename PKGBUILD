# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python38-curio
pkgver=1.6
pkgrel=2
pkgdesc='Concurrent I/O'
arch=(any)
url=https://github.com/dabeaz/curio
license=(BSD)
depends=(python38)
makedepends=(
  git
  python38-setuptools
)
checkdepends=(
  python38-pytest
  python38-sphinx
)
provides=(python38-multio-provider)
_tag=5d8ecb2333761b4fd629e14d940f3807d143c0ed
source=(git+https://github.com/dabeaz/curio.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd curio
  git describe --tags
}

build() {
  cd curio
  python3.8 setup.py build
}

check() {
  cd curio
  PYTHONPATH=$PWD/build/lib pytest
}

package() {
  cd curio
  python3.8 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python38-curio/
}

# vim: ts=2 sw=2 et:
