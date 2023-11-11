# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=psvtools-git
pkgver=0.1.0.3.gde2e2a9
pkgrel=1
arch=('any')
pkgdesc="PSV file trimmer, restoration, and validation utility (Python). (GIT version)"
url='https://github.com/kageurufu/psvtools'
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-setuptools'
  'python-installer'
  'python-wheel'
  'python-build'
  'python-pytest-runner'
)
conflicts=('psvtools')
provides=('psvtools')
source=('git+https://github.com/kageurufu/psvtools.git')
sha256sums=('SKIP')

pkgver() {
  cd psvtools
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd psvtools
  python -m build --wheel --no-isolation
}

package() {
  cd psvtools
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
