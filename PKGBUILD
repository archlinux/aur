# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Carlos Aznarán Laos <caznaranl@uni.pe>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=curses-menu
pkgname=python-${_base}
pkgver=0.6.14
pkgrel=1
pkgdesc="A simple console menu system using curses"
arch=('any')
url="https://github.com/pmbarrett314/${_base}"
license=(MIT)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-poetry')
# options=(!emptydirs)
source=(${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('11bf1bc8e68ff14bd5992b5dabdd136eb4f3b581c801753143541a996dea82d212b38e19514a11b335b5170f24ce5a2a5fcb2f450f9cfbd6585f2c1fbf33f8d5')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
