# Maintainer: nullableVoidPtr <nullableVoidPtr _ gmail _ com>
# Contributor: Philipp Joram <phijor AT t-online DOT de>

_gitname='pefile'
pkgname="python-${_gitname}-git"
_gitauthor='erocarrera'
pkgver=v2022.5.30.r3.g0d5ce5e
pkgrel=1
pkgdesc="A Python module to read and work with PE (Portable Executable) files"
url="https://github.com/${_gitauthor}/${_gitname}"
arch=('any')
license=('MIT')
makedepends=('git' 'python-setuptools')
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
source=($pkgname::git+https://github.com/${_gitauthor}/${_gitname}.git)
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  export PYTHONHASHSEED=0
  python setup.py install --root="${pkgdir}" -O1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set et sw=2 sts=2 tw=80:
