# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=python-versioningit
_name=versioningit
pkgver=1.1.1
pkgrel=1
pkgdesc='Versioning It with your Version In Git'
arch=('any')
url='https://github.com/jwodder/versioningit'
license=('MIT')
depends=('python-packaging' 'python-tomli')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('git' 'mercurial' 'python-pytest' 'python-tox')
source=("${_name}-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('3b7565a2db92f1206b5b833a72cc6936c8a74d65e94224f0a9eb54799d1561d9')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"
  tox -e py310
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
