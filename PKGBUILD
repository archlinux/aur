# Maintainer: Bram Oosterlynck <bram.oosterlynck@gmail.com>
pkgname=python-can-i-charge
gitname=can-i-charge
pkgver=0.6.11
pkgrel=1
pkgdesc="A CLI to fetch the status of charging stations "
arch=('any')
url="https://github.com/boosterl/can-i-charge"
license=('GPLv3')
depends=(
  'glibc'
  'python'
  'python-click'
  'python-prometheus_client'
  'python-shellrecharge'
)
makedepends=(
  'python-build'
  'python-installer'
)
source=("${pkgname}::git+https://github.com/boosterl/${gitname}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
