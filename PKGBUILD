# Maintainer: Pu Anlai
pkgname=pacupdate
pkgver=0.4
pkgrel=2
pkgdesc="Simple but hopefully complete pacman update script"
arch=('any')
url="https://github.com/Pu-Anlai/pacupdate"
license=('MIT')
depends=('python-aiohttp' 'python-feedparser' 'pyalpm' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-aioresponses')
install=
source=("https://github.com/Pu-Anlai/pacupdate/archive/refs/tags/0.4.tar.gz")
sha256sums=('db9e19253d51a9561c30fd3db9b9091e93b64a87b1245922e71f9ea728008b0e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || return 1
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}" || return 1
  PYTHONPATH="$(pwd)" pytest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || return 1
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
