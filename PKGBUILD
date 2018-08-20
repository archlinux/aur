# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=('python-keras-contrib-git' 'python2-keras-contrib-git')
_pkgname='keras-contrib'
pkgver=r460.3427000
pkgrel=1
pkgdesc='Keras community contributions'
arch=('x86_64')
url='https://github.com/keras-team/keras-contrib'
license=('MIT')
makedepends=('git' 'python' 'python2')
source=("${_pkgname%-git}"::'git+https://github.com/keras-team/keras-contrib.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build_python-keras-contrib-git() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

build_python2-keras-contrib-git() {
  cd "${srcdir}/${_pkgname%-git}"
  python2 setup.py build
}

package_python-keras-contrib-git() {
  depends=('python')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-keras-contrib-git() {
  depends=('python2')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "${srcdir}/${_pkgname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
