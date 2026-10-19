# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-letterboxdpy'
_name=${pkgname#python-}
pkgver=6.6.0
pkgrel=1
pkgdesc="A Python library for Letterboxd data."
arch=('any')
url="https://github.com/nmcassa/letterboxdpy"
license=('MIT')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-lxml'
  'python-curl_cffi'
  'python-fastfingertips'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('e46c70070c36de2d33c19846bdb8cb77cd3f66d4e38dd4ac636139286675fa4ae72437ae14b3827492981b7686bb87ab8aa17c63757b47e5884e01555d19873b')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
