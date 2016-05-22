pkgbase=python-vprof
pkgname=(python-vprof python2-vprof)
_appname=vprof
pkgver=0.3
pkgrel=1
pkgdesc="Visual profiler for Python"
arch=('i686' 'x86_64')
url="http://github.com/nvdv/vprof"
license=('BSD')
depends=()
makedepends=('python-pip' 'python2-pip')
source=('https://pypi.python.org/packages/87/1f/a67eec141c4ef1db95f71c1c5ca87e774551b65ec8514f83aaa9695bbd93/vprof-0.3.tar.gz')
md5sums=('8c696f54a9423a0e42286bb37f56949a')

prepare() {
  cd "${srcdir}"

  # py2 and py3
  cp -r "${srcdir}/${_appname}-${pkgver}" "${srcdir}/${_appname}2-${pkgver}"
}

package_python-vprof() {
  depends=('python' 'python-psutil' 'python-six' 'npm')

  cd "${srcdir}/${_appname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-vprof() {
  depends=('python2' 'python2-psutil' 'python2-six' 'npm')

  cd "${srcdir}/${_appname}2-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/vprof" "${pkgdir}/usr/bin/python2-vprof"
}
