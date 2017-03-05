# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Sebastien Binet <binet@lblbox>

pkgbase=python-ptrace
pkgname=('python-ptrace' 'python2-ptrace')
pkgver=0.9.2
pkgrel=1
pkgdesc="Python binding of ptrace library to trace processes and syscalls."
url="https://github.com/haypo/python-ptrace"
arch=('any')
license=('GPL2')
makedepends=('python' 'python2')
source=("https://github.com/haypo/${pkgbase}/archive/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('e4f6cac3a71d9e99e7ae96c4286899c7d45c7b9f01dbb6cef179a187b8432d3e')

prepare(){
  cp -dpr --no-preserve=owner "${pkgbase}-${pkgbase}-${pkgver}" "python2-ptrace-${pkgver}"
}

build() {
  # Build Python 3.x module
  cd "${srcdir}/${pkgbase}-${pkgbase}-${pkgver}"
  python setup.py build
  # Build Python 2.x module
  cd "${srcdir}/python2-ptrace-${pkgver}"
  python2 setup.py build
}

package_python-ptrace() {
  depends=('python')
  cd "${srcdir}/${pkgbase}-${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-ptrace() {
  depends=('python2')
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Rename gdb and strace scripts to avoid names conflict
  mv "${pkgdir}/usr/bin/gdb.py" "${pkgdir}/usr/bin/gdb2.py"
  mv "${pkgdir}/usr/bin/strace.py" "${pkgdir}/usr/bin/strace2.py"
}
