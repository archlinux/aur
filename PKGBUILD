# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=gbinder-python
pkgname=python-gbinder-git
pkgver=1.1.1.r14.g5089d76
pkgrel=1
pkgdesc="Python bindings for libgbinder - git version"
arch=('any')
url="https://github.com/waydroid/gbinder-python"
license=('GPL')
depends=('libgbinder')
conflicts=('python-gbinder')
replaces=('python-gbinder')
provides=('python-gbinder')
makedepends=('python-build' 'cython' 'python-installer' 'python-wheel' 'python-setuptools' 'python-wheel' 'git')
source=(git+${url}.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git -C "${srcdir}/${_pkgname}" clean -dfx
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
