# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Carlos Aznarán Laos <caznaranl@uni.pe>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=curses-menu
pkgname=python-${_base}
pkgver=0.6.11
pkgrel=1
pkgdesc="A simple console menu system using curses"
arch=('any')
url="https://github.com/pmbarrett314/${_base}"
license=(MIT)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-poetry')
# options=(!emptydirs)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('a212cb065950362c60c4858b3d957223c179f1c27f5b4d48ec4399ad728ee950889c692d857def8fd2cb2b0ea9607ee67e1385312000bf3f76de1b2517194a52')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
