# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-letterboxdpy'
_name=${pkgname#python-}
pkgver=6.7.0
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
sha512sums=('86c5489d9af10be9160ad921fb17d1ba5b38b72b35d2d69949dc906e48b56670947d68afe5594706d32d588d49965771092d33f871cca9770eba883fe307f79d')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
