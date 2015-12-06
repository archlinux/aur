# Maintainer: Nikola Milinković <nikmil@gmail.com>

_gitroot="https://github.com/Diaoul/babelfish"
_gitname="babelfish"
pkgbase=python2-babelfish-git
pkgname=('python2-babelfish-git' 'python-babelfish-git' 'python-babelfish-git-docs')
pkgver=0.5.6.r95.7d79ed6
pkgrel=1
epoch=1
pkgdesc="A module to work with countries and languages."
arch=(any)
url="https://github.com/Diaoul/babelfish"
license=('custom')
makedepends=('git' 'python2-setuptools' 'python-setuptools' 'python-sphinx')
source=("${_gitname}::git+${_gitroot}.git")
md5sums=('SKIP')
options=(zipman)

pkgver() {
  cd ${_gitname}
  printf "0.5.6.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd ${srcdir}/${_gitname}
  python3 setup.py test
}

package_python2-babelfish-git() {
  provides=(python2-babelfish=${pkgver})
  conflicts=(python2-babelfish)
  optdepends=('python-babelfish-git-docs: package manpages')
  cd ${srcdir}/${_gitname}
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/licenses/python2-babelfish-git"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/python2-babelfish-git/"
  install -v -m644 ./AUTHORS "${pkgdir}/usr/share/licenses/python2-babelfish-git/"
}

package_python-babelfish-git() {
  provides=(python-babelfish=${pkgver})
  conflicts=(python-babelfish)
  optdepends=('python-babelfish-git-docs: package manpages')
  cd ${srcdir}/${_gitname}
  python3 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/licenses/python-babelfish-git"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/python-babelfish-git/"
  install -v -m644 ./AUTHORS "${pkgdir}/usr/share/licenses/python-babelfish-git/"
}

package_python-babelfish-git-docs() {
  cd ${srcdir}/${_gitname}/docs
  make man
  install -v -m755 -d "${pkgdir}/usr/share/man/man1"
  install -v -m644 ./_build/man/babelfish.1 "${pkgdir}/usr/share/man/man1/"
}
