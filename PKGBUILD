# Maintainer: Nikola Milinković <nikmil@gmail.com>

_gitroot="https://github.com/Diaoul/babelfish"
_gitname="babelfish"
pkgbase=python2-babelfish-git
pkgname=('python2-babelfish-git' 'python-babelfish-git')
pkgver=0.5.5.90.3a177fb
pkgrel=1
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=(any)
url="https://github.com/Diaoul/babelfish"
license=('custom')
makedepends=('python2-setuptools' 'python-setuptools')
source=("${_gitname}::git+${_gitroot}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo 0.5.5.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  #git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package_python2-babelfish-git() {
  provides=(python2-babelfish=${pkgver})
  conflicts=(python2-babelfish)
  cd ${srcdir}/${_gitname}
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/licenses/python2-babelfish-git"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/python2-babelfish-git/"
  install -v -m644 ./AUTHORS "${pkgdir}/usr/share/licenses/python2-babelfish-git/"
}

package_python-babelfish-git() {
  provides=(python-babelfish=${pkgver})
  conflicts=(python-babelfish)
  cd ${srcdir}/${_gitname}
  python3 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/licenses/python-babelfish-git"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/python-babelfish-git/"
  install -v -m644 ./AUTHORS "${pkgdir}/usr/share/licenses/python-babelfish-git/"
}
