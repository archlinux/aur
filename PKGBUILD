pkgname=python2-rtsprofile
_name=rtsprofile
pkgver=2.0.0
pkgrel=1
pkgdesc="Library to read, manipulate and write RT system profiles using the RTSProfile XML schema"
url="https://github.com/gbiggs/rtsprofile"
depends=('python2')
makedepends=('python2' 'python2-setuptools')
license=('EPLv1.0')
arch=('any')
source=("https://github.com/gbiggs/${_name}/archive/${pkgver}.tar.gz")
md5sums=('fd82cc2a8ca986e375d4eff613d8e102')

# FIXME: probably some dependencies missing

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  # Fix for Python 2 scripts
  sed -i "s,env python *$,env python2,g" $(find . -type f)
  sed -i "s,/usr/bin/python *$,/usr/bin/env python2,g" $(find . -type f)

  python2 setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
