# Maintainer: Daringcuteseal <daringcuteseal@gmail.com>
pkgname=python-decli
pkgver=0.6.2
pkgrel=1
pkgdesc="Minimal, easy to use, declarative command line interface tool"
arch=('any')
url="https://github.com/Woile/decli"
license=('MIT')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
depends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e29abae67388aca6b4517bf048f0ea723fe93f5af6b06bbea6cbbc766d0086fd')

_pkgname="${pkgname/python-/}"

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  py.test -vvv tests/
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
