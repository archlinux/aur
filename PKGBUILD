# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='dockerize'
pkgname="${_pkgname}-git"
pkgver=0.2.2.r10.ga02d457
pkgrel=1
pkgdesc='Tool for creating minimal docker images from dynamic ELF binaries'
arch=('any')
url='https://github.com/larsks/dockerize'
license=('GPL3')
depends=('python-jinja' 'python-pyelftools')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
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
}

# vim: ts=2 sw=2 et:
