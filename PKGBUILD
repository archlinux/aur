# Maintainer: giver <giverc139@gmail.com>

_pyname=cxxheaderparser
pkgname=python-${_pyname}
pkgver=1.7.0
pkgrel=2
pkgdesc="Parse C++ header files and generate a data structure representing the class"
arch=('any')
url="https://github.com/robotpy/cxxheaderparser"
license=('BSD-3-Clause')
depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-hatch-vcs'
  'python-hatchling'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("$pkgname-$pkgver::git+$url#tag=$pkgver")
sha256sums=('c5614f1a8c0c355ce89d0c8572b49a317b39530b33a5f590700bf0ce749ab4bc')
b2sums=('8cdf22fe7bcace889a3971b665e6a6f158c83dc24ead7856c5854356d6020a7b43c93f297f46e46a27a08afc43eb9c0a608d13d33da6b4907747dd90221037bc')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  python -m venv --clear --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -Pm pytest -o addopts=''
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
