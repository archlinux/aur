# Maintainer: Pu Anlai
pkgname=pacupdate
pkgver=0.3
pkgrel=1
pkgdesc="Simple but hopefully complete pacman update script"
arch=('any')
url="https://github.com/Pu-Anlai/pacupdate"
license=('MIT')
depends=('python-aiohttp' 'python-feedparser' 'pyalpm' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-aioresponses')
install=
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('87bdcbce1ebfe748f7d9e410b0f637791c6b5e8c51873ccc278e7ae259336c25')

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
