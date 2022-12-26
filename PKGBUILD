# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bloscpack-git
pkgver=0.16.0.r46.g5efdadf
pkgrel=2
pkgdesc="Command line interface to and serialization format for Blosc"
arch=('any')
url="https://github.com/Blosc/bloscpack"
license=('MIT')
depends=('python-blosc' 'python-deprecated' 'python-numpy' 'python-six')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=("bloscpack=$pkgver")
conflicts=('bloscpack')
source=("git+https://github.com/Blosc/bloscpack.git")
sha256sums=('SKIP')


pkgver() {
  cd "bloscpack"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "bloscpack"

  python \
    -m build \
    --wheel \
    --no-isolation
}

package() {
  cd "bloscpack"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/bloscpack"
}
