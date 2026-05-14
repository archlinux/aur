# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>

pkgname=mackup
pkgver=0.10.3
pkgrel=1
pkgdesc="a small Python utitlity to keep your application settings in sync."
arch=('any')
url="https://github.com/lra/mackup"
license=('GPL3')
depends=('python' 'python-docopt-ng')

makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
checkdepends=('uv')

source=("mackup-${pkgver}.tar.gz::https://github.com/lra/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('795ad9b9fdc7b95be1e085845b724442a50a30ff0bcca06906d4f8aa7bbb0d98')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # uv run mackup --version
  uv run pytest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim: set ts=2 sts=2 sw=2 et:
