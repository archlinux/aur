# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=rawkit
pkgbase=python-rawkit-git
pkgname=('python-rawkit-git' 'python2-rawkit-git')
pkgver=v0.6.0_26_g93c3e9b6ad0b
pkgrel=1
pkgdesc="ctypes based libraw bindings "
arch=('any')
url="https://rawkit.readthedocs.io/"
license=('MIT')
depends=('libraw')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-mock'
              'python2-mock'
              'python-pytest'
              'python2-pytest'
              'python-numpy'
              'python2-numpy')
conflicts=('python-rawkit')
provides=('python-rawkit')
source=("git+https://github.com/photoshell/rawkit.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed s/-/_/g
}

build() {
  cd "${srcdir}"/${_pkgname}

  python setup.py build
  python2 setup.py build
}

check() {
  cd "${srcdir}"/${_pkgname}

  python -m pytest
  python2 -m pytest
}

package_python-rawkit-git() {
  depends+=('python')

  cd "${srcdir}"/${_pkgname}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-rawkit-git() {
  depends+=('python2')

  cd "${srcdir}"/${_pkgname}
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim: ts=2 sw=2 et:
