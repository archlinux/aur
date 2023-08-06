# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Carlos Aznarán Laos <caznaranl@uni.pe>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

_base=curses-menu
pkgname=python-${_base}
pkgver=0.7.0
pkgrel=1
pkgdesc="A simple console menu system using curses"
arch=('any')
url="https://github.com/pmbarrett314/${_base}"
license=(MIT)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-poetry')
source=(${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('d9b0ad3b481971881e144186d01e115f3a7dde569d7d0c3ccdac3a1ff4dbaf3e10e4f0d7281952cfc2945c4f970f418e13d6a56d94943b588793aedc74469aba')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
