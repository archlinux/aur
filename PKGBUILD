#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
#Contributor: Juergen Hoetzel <juergen@archlinux.org>
#Contributor: Comete <la_comete@tiscali.fr>

pkgname=python2-vpython
pkgver=6.11
pkgrel=1
pkgdesc="Easy-to-use 3D graphics module for Python."
arch=('i686' 'x86_64')
url="http://www.vpython.org"
depends=('gtkglextmm' 'python2-numpy' 'boost-libs' 'wxpython' 'tk' 'python2-fonttools' 'python2-polygon' 'python2-ttfquery')
makedepends=('boost' 'python2-setuptools')
conflicts=('python-vpython')
replaces=('python-vpython')
license=('custom')
options=(!libtool)

noextract=("${source[@]%%::*}")
source=("http://sourceforge.net/projects/vpythonwx/files/${pkgver}-release/vpython-wx-src.${pkgver}.tgz"
        "setup.patch")
md5sums=('c9791cda6efc73440b5c355e226543c2'
         'c879c7bff42ffba58766be3bcd5fdce2')

prepare() {
  cd "${srcdir}"

  rm -rf vpython-wx-${pkgver}
  mkdir vpython-wx-${pkgver}
  cd vpython-wx-${pkgver}
  tar -xzf "${srcdir}"/vpython-wx-src.${pkgver}.tgz
  patch -p0 < ../setup.patch

  sed -i "s|#![ ]*/usr/bin/env python[^2]|#!/usr/bin/env python2|" site-packages/vidle2/PyShell.py
}

build() {
  cd "${srcdir}"/vpython-wx-${pkgver}

  python2 setup.py build
}

package() {
  cd "${srcdir}"/vpython-wx-${pkgver}

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

