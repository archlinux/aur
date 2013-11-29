# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=python2-cssmin
_pythonname=cssmin
pkgver=0.2.0
pkgrel=1
arch=('any')
license=('MIT' 'BSD')
pkgdesc='Python port of the YUI CSS compression algorithm.'
depends=('python2')
url='https://github.com/zacharyvoase/cssmin'
source=("http://pypi.python.org/packages/source/c/${_pythonname}/${_pythonname}-${pkgver}.tar.gz"
	"https://raw.github.com/zacharyvoase/${_pythonname}/v${pkgver}/LICENSE")
md5sums=('c2798658a4f69663365a3e70c3b8250b'
         '7f9dbc2d22a3975e22fd6ce0f3d6268f')

build() {
  cd $srcdir/${_pythonname}-${pkgver}

  # necessary in cssmin.py
  find -name '*\.py' -exec sed -e 's@#!\(\s\)*/usr/bin/env python@&2@' -i {} \;

  python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1

  # this package contains BSD-licensed parts
  install -D -m 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
