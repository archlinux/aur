# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Sebastien Binet <binet@lblbox>

pkgbase=python-ptrace
pkgname=('python-ptrace' 'python2-ptrace')
pkgver=0.9.1
pkgrel=1
pkgdesc="Python binding of ptrace library to trace processes and syscalls."
url="https://github.com/haypo/python-ptrace"
arch=('any')
license=('GPL2')
makedepends=('python' 'python2')
source=("https://github.com/haypo/${pkgbase}/archive/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('f9c6ef64d0b0016a971d991895a0da78cc2e6da8a87577a1ae06a28726d664e4')

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
