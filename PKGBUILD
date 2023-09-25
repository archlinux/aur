# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=gbinder-python
pkgname=python-gbinder-git
pkgver=1.1.2.r0.ga2c5093
pkgrel=2
pkgdesc="Python bindings for libgbinder - git version"
arch=('any')
url="https://github.com/erfanoabdi/gbinder-python"
license=('GPL')
depends=('libgbinder')
conflicts=('python-gbinder')
replaces=('python-gbinder')
makedepends=('python-build' 'cython' 'python-installer' 'python-wheel' 'python-setuptools' 'python-wheel' 'git')
source=(git+${url}.git)
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  cython -a gbinder.pyx
}
build() {
  cd ${_pkgname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
