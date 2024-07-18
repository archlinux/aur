# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Carlos Aznarán Laos <caznaranl@uni.pe>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

_base=curses-menu
pkgname=python-${_base}
pkgver=0.8.3
pkgrel=1
pkgdesc="A simple console menu system using curses"
arch=('any')
url="https://github.com/pmbarrett314/${_base}"
license=(MIT)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('cf8894d6ee85c84bed3312fe48fbc2d0fc5b09453aec289b4301137ffdd63fcf834e895e5d33e6ee8da99c6e6da13c2bb1f87f84af86f2d57f8bf1d9044e8e6e')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
