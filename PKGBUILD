# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgbase=synadm
pkgname=${_pkgbase}-git
pkgver=0.30.r1.gf13cf1d
pkgrel=1
pkgdesc="CLI frontend to Matrix-Synapse admin APIs"
url="https://github.com/JOJ0/synadm"
depends=('python' 'python-click' 'python-requests' 'python-yaml' 'python-tabulate' 'python-click-option-group')
makedepends=('git' 'python3' 'python-setuptools')
provides=("$_pkgbase=$pkgver")
conflicts=("$_pkgbase")
license=('GPL3')
arch=('any')
source=("synadm::git+https://github.com/JOJ0/synadm.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/synadm"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/synadm"
  python setup.py build
}

package() {
  cd "$srcdir/synadm"
  python setup.py install --root="$pkgdir" --optimize=1
}
