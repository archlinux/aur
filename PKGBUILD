# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python38-trio-asyncio
pkgver=0.12.0
pkgrel=3
pkgdesc='A re-implementation of the asyncio mainloop on top of Trio'
arch=(any)
url=https://github.com/python-trio/trio-asyncio
license=(
  APACHE
  MIT
)
depends=(
  python38
  python38-async_generator
  python38-outcome
  python38-trio
)
makedepends=(
  git
  python38-setuptools
  python38-pytest-runner
)
_tag=970d81c498f857d052738a2c4db2c899910dc038
source=(git+https://github.com/python-trio/trio-asyncio.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd trio-asyncio

  git describe --tags | sed 's/^v//'
}

build() {
  cd trio-asyncio

  python3.8 setup.py build
}

package() {
  cd trio-asyncio

  python3.8 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  rm -rf ${pkgdir}/usr/lib/python3.8/site-packages/tests
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python38-trio-asyncio/
  install -Dm 644 LICENSE.MIT -t "${pkgdir}"/usr/share/licenses/python38-trio-asyncio/
}

# vim: ts=2 sw=2 et:
