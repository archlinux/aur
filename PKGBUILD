# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>

pkgbase=python-cheetah3-git
pkgname=('python-cheetah3-git' 'python2-cheetah3-git')
_name=Cheetah3
_reponame=cheetah3
pkgver=3.2.6.post1.r9.g856329c
pkgrel=1
pkgdesc="A Python 3-powered template engine and code generator"
arch=('any')
url="http://www.cheetahtemplate.org"
license=(MIT)
conflicts=('python-cheetah3')
pkgrel=1
pkgdesc="A Python powered template engine and code generator"
makedepends=('git'
             'python-setuptools'
             'python2-setuptools')
source=("${_reponame}::git+https://github.com/CheetahTemplate3/${_reponame}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_reponame}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


package_python-cheetah3-git() {
  depends=('python')
  optdepends=('python-markdown')

  cd "${srcdir}/${_reponame}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-cheetah3-git() {
  depends=('python2')
  optdepends=('python2-markdown')

  cd "${srcdir}/${_reponame}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Avoid conflict with python-cheetah3
  for name in cheetah cheetah-analyze cheetah-compile; do
    mv "${pkgdir}/usr/bin/${name}"{,2}
  done
}
