# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

_gituser=pycontribs
_pkgname=jenkinsapi

pkgbase=python-${_pkgname}
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.3.11
pkgrel=1
pkgdesc="Python API for accessing resources on a Jenkins continuous-integration server"
arch=('any')
url="https://github.com/${_gituser}/${_pkgname}"
license=('MIT')
makedepends=("python-setuptools" "python2-setuptools")
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('a212a244b0a6022a61657746c8120ac9b6db83432371b345154075eb8faceb61')


prepare() {
  cp -a ${_pkgname}-${pkgver}{,-python2}
}

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-python2"
  python2 setup.py build
}

package_python-jenkinsapi() {
  depends=("python" "python-requests" "python-pytz")

  cd "${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-jenkinsapi() {
  depends=("python2" "python2-requests" "python2-pytz")

  cd "${_pkgname}-${pkgver}-python2"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

# vim:set sw=2 sts=2 ft=sh et:
