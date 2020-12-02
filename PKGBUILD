# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='pdd'
pkgname="${_pkgname}-git"
pkgver=1.5.r2.g6e44f7c
pkgrel=2
pkgdesc='Tiny CLI date, time diff calculator with timers'
arch=('any')
url='https://github.com/jarun/pdd'
license=('GPL3')
depends=('python-dateutil')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 -t "${pkgdir}/usr/share/man/man1" "${_pkgname}.1"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
