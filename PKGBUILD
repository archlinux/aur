# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>

_pkgname=clikit
pkgname=python-clikit-git
pkgver=r114.1da34f1
pkgrel=3
pkgdesc="CliKit is a group of utilities to build beautiful and testable command line interfaces."
arch=('any')
provides=('python-clikit')
conflicts=('python-clikit')
url="https://github.com/sdispater/${_pkgname}"
license=('MIT')
depends=('python-pastel>=0.2.0' 'python-pastel<0.3.0' 'python-pylev>=1.3' 'python-pylev<2.0' 'python-crashtest>=0.3.0' 'python-crashtest<0.4.0' 'python>=3.6' 'python<4.0')
makedepends=('python-dephell')
source=("${_pkgname}::${url//https/git}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"/${_pkgname}

    # poetry-generated setup.py are fatally broken, see:
    # https://github.com/sdispater/poetry/issues/866
    dephell deps convert --from pyproject.toml --to setup.py
}

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "${srcdir}"/${_pkgname}
  python setup.py build
}

package() {
  cd "${srcdir}"/${_pkgname}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}


# vim:set ts=2 sw=2 et:
