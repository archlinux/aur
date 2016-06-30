# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgbase='python-pip'
pkgname=('python-pip' 'python2-pip')
pkgver='8.1.2'
pkgrel=1
pkgdesc="The PyPA recommended tool for installing Python packages"
url="https://pip.pypa.io/"
arch=('any')
license=('MIT')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=('git://github.com/pypa/pip')
md5sums=('SKIP')

package_python-pip() {
  depends=('python' 'python-setuptools')

  cd "${srcdir}/pip"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}/"
  cp LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-pip() {
  depends=('python2' 'python2-setuptools')
  conflicts=('python-pyinstall')
  replaces=('python-pyinstall')

  cd "${srcdir}/pip"
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  
  mv "${pkgdir}/usr/bin/pip" "${pkgdir}/usr/bin/pip2"
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" "${pkgdir}/usr/lib/python2.7/site-packages/pip/__init__.py"
  python2 -m compileall "${pkgdir}/usr/lib/python2.7/site-packages/pip/__init__.py"
  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}/"
  cp LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
