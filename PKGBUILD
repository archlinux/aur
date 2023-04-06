# Maintainer: Hu Butui <hot123tea123@gmail.com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-gpustat
_pkgname=gpustat
pkgver=1.1
epoch=1
pkgrel=1
pkgdesc='A simple command-line utility for querying and monitoring GPU status'
arch=('any')
url='https://github.com/wookayin/gpustat'
license=('MIT')
depends=(
  nvidia-utils
  python-blessed
  python-nvidia-ml-py
  python-psutil
  python-six
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/wookayin/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('848d76f1c1fa15c84d2f7e59c6fc4cd7a38f3a52e99390a7e966e8f2a020ecac')

build() {
  cd "${_pkgname}-${pkgver}"
  SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
  python -m build --wheel --no-isolation
}


package(){
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:ts=2:sw=2:et:
