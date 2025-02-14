# Maintainer : Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=python-jetpytools-git
pkgver=1.2.3.1.g58e6bfe
pkgrel=1
pkgdesc="Collection of stuff that's useful in general python programming. (GIT version)"
url="https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools"
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
provides=('python-jetpytools' 'python-stgpytools' 'python-stgpytools-git')
conflicts=('python-jetpytools' 'python-stgpytools' 'python-stgpytools-git')
source=('git+https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools.git')
sha256sums=('SKIP')

pkgver() {
  cd jetpytools
  echo "$(git describe --long --tags | tr - . | tr -d r | tr -d v)"
}

build() {
  cd jetpytools
  python -m build --wheel --no-isolation
}

package() {
  cd jetpytools
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
