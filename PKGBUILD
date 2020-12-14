# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='waybackpy'
pkgname="${_pkgname}-git"
pkgver=2.3.0.r0.gd3e68d0
pkgrel=1
pkgdesc='Python package & command-line program that interfaces with the Internet Archives Wayback Machine API'
arch=('any')
url='https://github.com/akamhy/waybackpy'
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
