# Maintainer: Bram Oosterlynck <bram.oosterlynck@gmail.com>
pkgname=python-shellrecharge
gitname=python-shellrecharge
pkgver=0.1.22
pkgrel=1
pkgdesc="Python 3 package to retrieve public and private EV charger data from Shell Recharge "
arch=('any')
url="https://github.com/cyberjunky/python-shellrecharge"
license=('MIT')
depends=(
  'glibc'
  'python'
  'python-aiohttp'
  'python-aiohttp-retry'
  'python-bs4'
  'python-pydantic'
  'python-yarl'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pdm-backend'
)
source=("${pkgname}::git+https://github.com/cyberjunky/${gitname}.git#tag=${pkgver}")
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
