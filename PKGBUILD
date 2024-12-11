# Maintainer: Dimitri Merejkowsky <d.merej@gmail.com>
pkgname=python-cli-ui
pkgver="0.18.0"
pkgrel=1
pkgdesc="Build nice user interfaces in the terminal"
url="https://github.com/your-tools/python-cli-ui"
arch=('any')
license=('MIT')
depends=('python' 'python-colorama' 'python-unidecode' 'python-tabulate')
makedepends=('python-poetry' 'python-installer')
source=("python-cli-ui-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

checkdepends=('python-pytest')
md5sums=('27b1f57c66bd631f9c32ca4e2045ff5f')

build() {
  cd ${srcdir}/python-cli-ui-${pkgver}
  python -m poetry build
}

check() {
  cd ${srcdir}/python-cli-ui-${pkgver}
  python -m poetry install
  python -m poetry run pytest
}

package() {
  cd ${srcdir}/python-cli-ui-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  mkdir -p $pkgdir/usr/share/licenses/python-cli-ui
  install LICENSE $pkgdir/usr/share/licenses/python-cli-ui/LICENSE
}

# vim:set ts=2 sw=2 et:
