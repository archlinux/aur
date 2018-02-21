# Maintainer: Grey Christoforo <first name at last name dot net>

pkgbase=python-pico-git
pkgname=('python-pico-git' 'python2-pico-git')
_module=pico-python
pkgver=r135.98777ef
pkgrel=1
pkgdesc="PicoScope Python Interface"
arch=('any')
url="https://github.com/colinoflynn/pico-python"
license=('BSD 2-Clause')
#source=("${_module}"'::git+http://github.com/greyltc/pico-python#branch=greyltc-patch-1')
source=("${_module}"'::git+http://github.com/colinoflynn/pico-python')
md5sums=('SKIP')
optdepends=('libps2000' 'libps2000a' 'libps3000' 'libps3000a' 'libps4000' 'libps4000a' 'libps5000' 'libps5000a' 'libps6000')

pkgver() {
  cd "${srcdir}/${_module}"
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}

package_python-pico-git() {
  provides=('python-pico')
  conflicts=('python-pico')
  depends=('python')
  makedepends=('python-setuptools')
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}" --optimize 1
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-pico-git() {
  provides=('python2-pico')
  conflicts=('python2-pico')
  depends=('python2')
  makedepends=('python2-setuptools')
  cd "${srcdir}/${_module}"
  python2 setup.py install --root="${pkgdir}" --optimize 1
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
