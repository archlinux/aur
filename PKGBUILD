# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_gitname=smpp.pdu
pkgname=python-smpp-pdu-git
pkgver=0.3.r13.20acc84
pkgrel=1
pkgdesc='Library for parsing Protocol Data Units (PDUs) in SMPP protocol'
url='https://github.com/hologram-io/smpp.pdu'
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
source=("git+https://github.com/hologram-io/smpp.pdu.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_gitname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_gitname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
