# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=cmarkgfm
pkgbase="python-${_name//_/-}"
pkgname=("python-${_name//_/-}" "python2-${_name//_/-}")
pkgver=0.4.0
pkgrel=1
pkgdesc="Minimalist Python bindings to GitHub's fork of cmark, a Markdown rendering library."
arch=('i686' 'x86_64')
url="https://github.com/jonparrott/${_name}"
license=('MIT')
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('977d7061779c7ebc5cbe7af71adb795ced96058552fe5f6b646d95b5055959be')


prepare() {
  cp -a "${srcdir}/${_name}-${pkgver}"{,-python2}
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py build
}

package_python-cmarkgfm() {
  depends+=('python-cffi>=1.0.0')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build

  install -Dm655 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python2-cmarkgfm() {
  depends+=('python2-cffi>=1.0.0')

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build

  install -Dm655 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
