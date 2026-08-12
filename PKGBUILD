# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>

_pkgname=clikit
pkgname=python-clikit-git
pkgver=0.6.2.r14.g1da34f1
pkgrel=2
pkgdesc="CliKit is a group of utilities to build beautiful and testable command line interfaces."
arch=('any')
provides=("python-clikit")
conflicts=('python-clikit')
url="https://github.com/sdispater/${_pkgname}"
license=('MIT')
depends=(
  'python'
  'python-crashtest>=0.3.0'
  'python-pastel>=0.2.0'
  'python-pastel<0.3.0'
  'python-pylev>=1.3'
  'python-pylev<2.0'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_pkgname}" clean -dfx
}

build() {
  cd "${srcdir}"/${_pkgname}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}


# vim:set ts=2 sw=2 et:
