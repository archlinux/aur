# Maintainer: envolution
# Contributor: PumpkinCheshire <me at pumpkincheshire dot top>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-langcodes
_pkgname=langcodes
pkgver=3.5.0
pkgrel=3
pkgdesc='A toolkit for working with and comparing the standardized codes for languages'
arch=('any')
url="https://github.com/georgkrause/langcodes"
license=(MIT)
depends=('python')
makedepends=(
  'python-installer'
  'python-build'
  'python-wheel'
  'python-pytest'
  'python-setuptools-scm'
)
checkdepends=(
# 'python-pytest-cov' 
# 'python-language-data' #removed until this package is fixed
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/georgkrause/langcodes/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=('90e20a1118ada01b819c32687cdf30882df5c0eb28a27bd2e45639d18380218e1d8ce28b5e55b4c603e709a4edfa6260471f97bf65266a638170d9f9ddab4020')

build() {
  cd "$_pkgname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pkgname-$pkgver"
  # python -m pytest # disabling until python-language-data is updated
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir=${pkgdir} dist/*.whl
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
# vim:set ts=2 sw=2 et:
