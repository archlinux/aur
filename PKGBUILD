# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='pdd'
pkgname="${_pkgname}-git"
pkgver=1.4.r17.g19ea856
pkgrel=1
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
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "${_pkgname}.1"
}

# vim: ts=2 sw=2 et:
