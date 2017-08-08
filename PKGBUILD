# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>
# Contributor: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

_gituser=pycontribs
_pkgname=jenkinsapi

pkgbase=python-${_pkgname}-git
pkgname=("python-${_pkgname}-git" "python2-${_pkgname}-git")
pkgver=0.3.5
pkgrel=1
pkgdesc="A Python API for accessing resources on a Jenkins continuous-integration server."
arch=('any')
url="https://github.com/${_gituser}/${_pkgname}"
license=('MIT')
makedepends=("python-setuptools" "python2-setuptools")

source=("${_pkgname}::git+https://github.com/pycontribs/jenkinsapi.git")

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "%s.r%s.%s" \
    "$pkgver" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -a ${_pkgname}{,-python2}
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-python2"
  python2 setup.py build
}

package_python-jenkinsapi-git() {
  depends=("python" "python-requests" "python-pytz")
  conflicts=("python-${_pkgname}")

  cd "${srcdir}/${_pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-jenkinsapi-git() {
  depends=("python2" "python2-requests" "python2-pytz")
  conflicts=("python2-${_pkgname}")

  cd "${srcdir}/${_pkgname}-python2"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set sw=2 sts=2 ft=sh et:
