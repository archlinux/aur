# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python38-sniffio
pkgver=1.3.0
pkgrel=2
pkgdesc='Sniff out which async library your code is running under'
arch=(any)
url=https://github.com/python-trio/sniffio
license=(MIT)
depends=(python38)
makedepends=(
  git
  python38-setuptools
)
checkdepends=(
  python38-curio
  python38-pytest
  python38-pytest-cov
)
_tag=cb8a03d45371efb20156ec895003a9bd988ac89b
source=(git+https://github.com/python-trio/sniffio.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd sniffio
  git describe --tags | sed 's/^v//'
}

build() {
  cd sniffio
  python3.8 setup.py build
}

check() {
  cd sniffio
  pytest
}

package() {
  cd sniffio
  python3.8 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python38-sniffio/
}

# vim: ts=2 sw=2 et:
