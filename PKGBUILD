# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=scurve
pkgver=0.2
pkgrel=1
pkgdesc='A collection of algorithms and visualisation tools related to space-filling curves.'
arch=(any)
url=https://github.com/cortesi/scurve
license=('custom:unknown')
depends=(python2-pillow python2-cairo)
makedepends=(python2-setuptools)
source=(https://pypi.python.org/packages/source/s/scurve/${pkgname}-${pkgver}.tar.gz
       pillow.patch
       progress.patch)
md5sums=(6bfbb91c6666df71f039476f16412898
         51cd947d8d9eed281b4533b942c7941a
         22a492d2f22e9d680751fe7c36ba6792)

prepare() {
  cd ${srcdir}
  patch -p0 < pillow.patch
  patch -p0 < progress.patch

  cd ${srcdir}/${pkgname}-${pkgver}
  
  msg2 'Replacing python shebang by python2 shebang...'
  find . -type f -exec sed -i \
    -e '1s|^#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    -e '1s|^#!/usr/bin/python$|#!/usr/bin/env python2|' \
    "{}" \;
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1
}
