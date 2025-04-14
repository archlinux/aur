# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgbase=synadm
pkgname=${_pkgbase}-git
pkgver=0.48.r5.g02a3870
pkgrel=1
pkgdesc="CLI frontend to Matrix-Synapse admin APIs"
url="https://codeberg.org/synadm/synadm"
depends=('python' 'python-click' 'python-requests' 'python-yaml' 'python-tabulate' 'python-click-option-group' 'python-dnspython')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-beautifulsoup4: docs scraping')
provides=("$_pkgbase=$pkgver")
conflicts=("$_pkgbase")
license=('GPL-3.0-or-later')
arch=('any')
source=("git+https://codeberg.org/synadm/synadm.git")
sha256sums=('SKIP')

pkgver() {
  cd synadm
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd synadm
  python -m build --wheel --no-isolation
}

package() {
  cd synadm
  python -m installer --destdir="$pkgdir" dist/*.whl
}
