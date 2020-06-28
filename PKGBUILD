# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=wireviz
pkgname=${_pkgname}-git
pkgver=r202.8326ddd
pkgrel=1
pkgdesc='Easily document cables, wiring harnesses and connector pinouts'
arch=('any')
url='https://github.com/formatc1702/WireViz'
license=('GPL3')
depends=('python-graphviz')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  cp -r 'examples' 'tutorial' "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
