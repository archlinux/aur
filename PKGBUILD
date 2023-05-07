# Maintainer: afontenot <adam.m.fontenot@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=cinemagoer
pkgname=python-cinemagoer
pkgver=2023.05.01
pkgrel=1
pkgdesc="Python bindings for the Internet Movie Database (IMDb)"
url="https://cinemagoer.github.io/"
arch=('any')
license=('GPL2')
depends=('python-lxml' 'python-sqlalchemy' 'python-tqdm' 'python-setuptools'
         'python-importlib-metadata')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
provides=('python-imdbpy')
conflicts=('python-imdbpy')
source=("https://github.com/${_name}/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('eceeae2c4241d2eab39aaddbe99a7aa61d28578fb127bf9aa44c8bea024c25e5')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

# Tests involve HTTP connections and are flaky
# check() {
#   cd "${pkgname}-${pkgver}"
#   export PYTHONPATH="build:${PYTHONPATH}"
#   pytest -v
# }

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}/"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
# vim:set ts=2 sw=2 et:
