# Maintainer : Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=python-stgpytools-git
pkgver=1.2.2.0.g1cfcf8b
pkgrel=1
pkgdesc="Collection of stuff that's useful in general python programming. (GIT version)"
url="https://github.com/Setsugennoao/stgpytools"
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
)
provides=('python-stgpytools')
conflicts=('python-stgpytools')
source=('git+https://github.com/Setsugennoao/stgpytools.git')
sha256sums=('SKIP')

pkgver() {
  cd stgpytools
  echo "$(git describe --long --tags | tr - . | tr -d r | tr -d v)"
}

build() {
  cd stgpytools
  python -m build --wheel --no-isolation
}

package() {
  cd stgpytools
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
