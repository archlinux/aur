# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_rawname=py65
_pkgbase="python-${_rawname}"
pkgname="${_pkgbase}-git"
pkgver=1.2.0.r12.gf857233
pkgrel=2
pkgdesc="Emulate 6502-based microcomputer systems in Python (bleeding-edge version)"
arch=('any')
url="https://github.com/mnaberez/${_rawname}"
license=('BSD-3-Clause')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=("${_pkgbase}")

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_rawname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_rawname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_rawname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

