# Maintainer: Nikola Milinković <nikmil@gmail.com>

_gitroot="https://github.com/Toilal/rebulk"
_gitname="rebulk"
pkgbase=python2-rebulk-git
pkgname=('python2-rebulk-git' 'python-rebulk-git')
pkgver=0.6.5.r149.91b27cc
pkgrel=1
pkgdesc="Python library that performs advanced searches in strings."
arch=(any)
url="https://github.com/Toilal/rebulk"
license=('MIT')
makedepends=('git' 'python2-setuptools' 'python-setuptools' 'python-pytest-runner' 'python2-pytest-runner')
checkdepends=('python-pytest')
source=("${_gitname}::git+${_gitroot}.git")
md5sums=('SKIP')
options=(zipman)

pkgver() {
  cd ${_gitname}
  printf "0.6.5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd ${srcdir}/${_gitname}
  python3 setup.py test
  python2 setup.py test
}

package_python2-rebulk-git() {
  provides=(python2-rebulk=${pkgver})
  conflicts=(python2-rebulk)
  pkgdesc="Python library that performs advanced searches in strings. (python2 version)"
  depends=('python2-six' 'python2-regex' 'python2-ordereddict')

  cd ${srcdir}/${_gitname}
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/licenses/python2-rebulk-git"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/python2-rebulk-git/"
}

package_python-rebulk-git() {
  provides=(python-rebulk=${pkgver})
  conflicts=(python-rebulk)
  pkgdesc="Python library that performs advanced searches in strings. (python3 version)"
  depends=('python-six' 'python-regex')

  cd ${srcdir}/${_gitname}
  python3 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/licenses/python-rebulk-git"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/python-rebulk-git/"
}
