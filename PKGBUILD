# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='elasticsearch-faker'
pkgname="${_pkgname}-git"
pkgver=r10.937b254
pkgrel=1
pkgdesc='CLI tool to generate fake data for Elasticsearch'
arch=('any')
url='https://github.com/thombashi/elasticsearch-faker'
license=('MIT')
depends=('python-click'
        'python-elasticsearch'
        'python-envinfopy'
        'python-faker'
        'python-jinja'
        'python-loguru'
        'python-tqdm')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
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
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
