# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>

_pkgname=clikit
pkgname=python-clikit-git
pkgver=r114.1da34f1
pkgrel=1
pkgdesc="CliKit is a group of utilities to build beautiful and testable command line interfaces."
arch=('any')
provides=('python-clikit')
confilicts=('python-clikit')
url="https://github.com/sdispater/${_pkgname}"
license=('MIT')
depends=('python-pastel>=0.2.0' 'python-pastel<0.3.0' 'python-pylev>=1.3' 'python-pylev<2.0' 'python-crashtest>=0.3.0' 'python-crashtest<0.4.0' 'python>=3.6' 'python<4.0')
makedepends=('python-poetry>=1.0.0' 'python-pip')
checkdepends=('python-pytest-mock>=2.0.0')
source=("${_pkgname}::${url//https/git}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "${srcdir}"/${_pkgname}
  poetry build
}

package() {
  cd "${srcdir}"/${_pkgname}
  echo "${pkgdir}"
  pip install --no-deps --ignore-installed --no-cache-dir --prefix "${pkgdir}/usr" dist/clikit-$(poetry version -s)-py2.py3-none-any.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}


# vim:set ts=2 sw=2 et:
