# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=python2-cssmin
_name=${pkgname#python2-}
pkgver=0.2.0
pkgrel=2
arch=('any')
license=('MIT' 'BSD')
pkgdesc='Python port of the YUI CSS compression algorithm. No longer maintained.'
depends=('python2')
url='https://github.com/zacharyvoase/cssmin'
source=("https://pypi.python.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
	"https://raw.github.com/zacharyvoase/${_name}/v${pkgver}/LICENSE")
md5sums=('c2798658a4f69663365a3e70c3b8250b'
         '7f9dbc2d22a3975e22fd6ce0f3d6268f')

PYTHON='python2'

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  # necessary in cssmin.py
  find -name '*\.py' -exec sed -e 's@#!\(\s\)*/usr/bin/env python$@&2@' -i {} \;
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  $PYTHON setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  $PYTHON setup.py install --root="$pkgdir" --optimize=1 --skip-build
  # this package contains BSD-licensed parts
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

