# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Carlos Aznarán Laos <caznaranl@uni.pe>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

_base=curses-menu
pkgname=python-${_base}
pkgver=0.8.1
pkgrel=1
pkgdesc="A simple console menu system using curses"
arch=('any')
url="https://github.com/pmbarrett314/${_base}"
license=(MIT)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-poetry')
source=(${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('cc215591369667cfdaf95c75e6c2be2de1c2bd6c4182d90c31940a9274d426418711f8a0c4877f6e7af4717e775699e0c08481385c752aa5266e1f10b66962f2')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
