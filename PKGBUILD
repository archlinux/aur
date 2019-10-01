# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=('python-aigpy-git' 'python2-aigpy-git')
_pkgname=aigpy
pkgver=20190925.fc958ab
pkgrel=1
pkgdesc="Python Common Lib"
arch=('any')
url="https://github.com/yaronzz/AIGPY"
license=('MIT')
makedepends=(
  'git'
  'python-setuptools'
  'python2-setuptools'
)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-2"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-2"
  python2 setup.py build
}

package_python-aigpy-git() {
  depends=(
    'python'
    'python-requests'
    'python-colorama'
    'python-mutagen'
  )
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-aigpy-git() {
  depends=(
    'python2'
    'python2-requests'
    'python2-colorama'
    'python2-mutagen'
    'python2-futures'
  )
  cd "${srcdir}/${_pkgname}-2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_pkgname}-2/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
