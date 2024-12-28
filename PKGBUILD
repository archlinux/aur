# Maintainer: Jörg Hansen <joerg DOT hansen AT posteo DOT de>
# Contributor: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-fritzconnection-git
pkgver=1.9.1.r282.g1e200b1
pkgrel=3
pkgdesc='Python-Tool to communicate with the AVM Fritz!Box.'
license=('MIT')
arch=('any')
url='https://github.com/kbr/fritzconnection'
provides=("python-fritzconnection=${pkgver}")
conflicts=('python-fritzconnection')
depends=(
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'python-segno: QR code support'
)
source=("git+https://github.com/kbr/fritzconnection.git")
sha512sums=('SKIP')

pkgver() {
  cd fritzconnection
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd fritzconnection
  python -m build --wheel --no-isolation
}

package() {
  cd fritzconnection
  python -m installer --destdir="$pkgdir" dist/*.whl
}
