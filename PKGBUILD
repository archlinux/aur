# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Carlos Aznarán Laos <caznaranl@uni.pe>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

_base=curses-menu
pkgname=python-${_base}
pkgver=0.9.0
pkgrel=2
pkgdesc="A simple console menu system using curses"
arch=('any')
url="https://github.com/pmbarrett314/${_base}"
license=(MIT)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-poetry' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('8c0836dc0ac8fdfbd1ef016dd4868dcb17389f1690af742f8aa7a57d67a6dd466a9155d82abccb15da54e1592d5c6ce9f57b3818237b4abe7bdd38790b3322ef')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
