# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>

_pkgname=clikit
pkgname=python-clikit-git
pkgver=0.6.2.r14.g1da34f1
pkgrel=1
pkgdesc="CliKit is a group of utilities to build beautiful and testable command line interfaces."
arch=('any')
provides=("python-clikit")
conflicts=('python-clikit')
url="https://github.com/sdispater/${_pkgname}"
license=('MIT')
depends=('python-pastel>=0.2.0' 'python-pastel<0.3.0' 'python-pylev>=1.3' 'python-pylev<2.0' 'python>=3.7' 'python<4.0')
makedepends=(python-build python-installer python-wheel)
source=("${_pkgname}::git+${url}")
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
