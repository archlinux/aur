# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: qlonik <volodin.n at gmail dot com>
# Contributor: Mario A. Vazquez <mario_vazq@hotmail.com>

pkgname='python2-pyxdg'
_name="${pkgname#python2-}"
pkgver=0.27
pkgrel=1
pkgdesc='Official freedesktop.org XDG specifications support library'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('LGPL')
depends=('python2')
makedepends=('python2-setuptools')
provides=("pyxdg=${pkgver}" "python2-xdg=${pkgver}")
conflicts=('pyxdg' 'python2-xdg' 'python2-pyxdg-git')
_tarname="${_name}-${pkgver}"
source=("https://pypi.python.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
sha256sums=('80bd93aae5ed82435f20462ea0208fb198d8eec262e831ee06ce9ddb6b91c5a5')
validpgpkeys=('6391296E3F25C0A721C1F1AFAF88B3AC5DECB224') # Thomas Kluyver

prepare() {
  echo 'Changing hashbangs in *.py files to refer to python2'
  sed -e 's|#![ ]*/usr/bin/python[^2]\?|#!/usr/bin/python2|' \
      -e 's|#![ ]*/usr/bin/env python[^2]\?|#!/usr/bin/env python2|' \
      -e 's|#![ ]*/bin/env python[^2]\?|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
}

build() {
    cd "${_tarname}"
    python2 setup.py build
}

package() {
    cd "${_tarname}"
    python2 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
