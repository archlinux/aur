# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=('python-analyzemft-git' 'python2-analyzemft-git')
_pkgname=analyzeMFT
pkgver=20180318.64c71d7
pkgrel=1
pkgdesc='Analyze the $MFT from a NTFS filesystem.'
arch=('any')
url="https://github.com/dkovar/analyzeMFT"
license=('CPL')
makedepends=('git' 'python2-setuptools' 'python-setuptools')
source=("${_pkgname}::git+${url}.git"
  python3.patch)
md5sums=('SKIP'
  '700954e4751b1e2128448a278d69a6d4')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-2"
  cd "${srcdir}/${_pkgname}"
  patch -p1 <"${srcdir}/python3.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-2"
  python2 setup.py build
}

package_python-analyzemft-git() {
  depends=('python')
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-analyzemft-git() {
  depends=('python2')
  cd "${srcdir}/${_pkgname}-2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
# vim:set ts=2 sw=2 et:
