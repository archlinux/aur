# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=python-inplace
_gitpkgname=inplace
pkgver=1.0.2
pkgrel=1
pkgdesc='In-place file processing in Python'
arch=('any')
url='https://github.com/jwodder/inplace'
license=('MIT')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/jwodder/inplace/archive/v${pkgver}.tar.gz"
)

sha512sums=('985109bfe058fb58a6991fdc019d85d419a9b33fb7111503ccbed2d46b76b18f34a92e5cc886471f5b7ceff73a973571e09aee058853074334d6c7eac203f1aa')

build() {
  cd "${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.rst'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
